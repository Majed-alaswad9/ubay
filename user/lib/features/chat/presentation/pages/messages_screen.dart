import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:signalr_flutter/signalr_flutter.dart';
import 'package:user/core/common/constants/configuration/uri_routs.dart';
import 'package:user/features/app/presentation/widgets/app_text_field.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key, required this.chatId});
  final String chatId;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late IOWebSocketChannel channel;
  final baseUrl = Uri.parse(EndPoints.socketUrl);
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();
  @override
  void initState() {
    print(baseUrl);
    channel = IOWebSocketChannel.connect(
      '${EndPoints.socketUrl}',
    );

    listen();
    super.initState();
  }

  listen() {
    channel.stream.listen((message) {
      print(message);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
