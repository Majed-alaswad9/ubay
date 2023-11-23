import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user/core/config/themes/my_color_scheme.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/my_transactions/presintation/pages/sales_screen.dart';
import 'package:user/generated/locale_keys.g.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
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
        children: [SalesPage()],
      ),
    ));
  }
}
