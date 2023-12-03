import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:user/core/common/constants/configuration/uri_routs.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/stream_socket.dart';
import 'package:user/features/app/domain/repository/prefs_repository.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/chat/presentation/widget/list_messages.dart';
import '../../data/model/chat_model/chats_model.dart' as chat;
import '../bloc/chat_bloc.dart';

class MessagesParams {
  final String chatId;
  final chat.Product product;
  final chat.Customer user2;

  MessagesParams(
      {required this.chatId, required this.product, required this.user2});
}

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key, required this.params});
  final MessagesParams params;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  IO.Socket socket = IO.io(EndPoints.socketUrl, <String, dynamic>{
    'autoConnect': false,
    'transports': ['websocket'],
  });
  final user = GetIt.I<PrefsRepository>().user;

  StreamSocket streamSocket = StreamSocket();

  @override
  void initState() {
    initConnect();
    context
        .read<ChatBloc>()
        .add(GetAllMessagesEvent(chatId: widget.params.chatId));
    super.initState();
  }

  initConnect() {
    socket.connect();
    socket.onConnect((_) => print('connect'));
    socket.emit('join chat', widget.params.chatId);
    socket.emit('setup', user);
    socket.on('message received', (data) {
      streamSocket.addResponse(data);
    });

    socket.onError((error) {});
    socket.onConnectError((err) => print(err));
  }

  @override
  void dispose() {
    socket.off('message received');
    streamSocket.dispose();
    socket.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      resizeToAvoidBottomInset: false,
      appBar: UBayAppBar(
        appBarParams: AppBarParams(
          centerTitle: false,
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(widget.params.user2.photo),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.params.user2.name,
                style: context.textTheme.titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          tittleStyle:
              context.textTheme.titleMedium!.copyWith(color: Colors.white),
        ),
        isLeading: true,
      ),
      body: SingleChildScrollView(
        child: ListMessages(
            user2: widget.params.user2,
            user: user!,
            product: widget.params.product,
            streamSocket: streamSocket),
      ),
    );
  }
}
/*

* */
