import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user/core/config/themes/my_color_scheme.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/chat/presentation/pages/chat_purchases_screen.dart';
import 'package:user/features/chat/presentation/pages/chat_sales_screen.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../../core/common/constants/configuration/uri_routs.dart';
import '../../../../generated/locale_keys.g.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: context.colorScheme.primary,
            title: Text(
              LocaleKeys.transactions.tr(),
              style:
                  context.textTheme.titleLarge!.copyWith(color: Colors.white),
            ),
            centerTitle: true,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              controller: tabController,
              labelColor: context.colorScheme.white,
              labelStyle: context.textTheme.titleMedium,
              unselectedLabelColor: Colors.white,
              indicatorColor: context.colorScheme.primary,
              tabs: [
                Tab(
                  text: LocaleKeys.sales.tr(),
                ),
                Tab(
                  text: LocaleKeys.purchases.tr(),
                )
              ],
            ),
          )
        ];
      },
      body: TabBarView(
        controller: tabController,
        clipBehavior: Clip.antiAlias,
        children: const [ChatSalesScreen(), ChatPurchasesScreen()],
      ),
    ));
  }
}
