import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/common/model/page_state/result_builder.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/loading_indicator.dart';
import 'package:user/features/my_transactions/data/model/sales_model/sales_model.dart';
import 'package:user/features/my_transactions/presintation/widget/card_sales.dart';
import 'package:user/generated/locale_keys.g.dart';

import '../bloc/transactions_bloc.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  @override
  void initState() {
    context.read<TransactionsBloc>().add(GetAllSalesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        return PageStateBuilder<SalesModel>(
          loading: const Center(child: LoadingIndicator()),
          init: const SizedBox.shrink(),
          empty: Center(
            child: Text(LocaleKeys.no_data.tr()),
          ),
          error: (error) => Center(
            child: Text(error.toString()),
          ),
          result: state.allSales,
          success: (data) => RefreshIndicator(
            onRefresh: () async {
              context.read<TransactionsBloc>().add(GetAllSalesEvent());
            },
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTransactions(
                          iconData: Icons.warning_amber,
                          iconColor: Colors.orange,
                          color: context.colorScheme.errorContainer,
                          title: data.wait[index].product.title,
                          header: LocaleKeys.deliveryStatus_seller_wait.tr(),
                          price: data.wait[index].product.price,
                          photos: data.wait[index].product.photos,
                          barcode: true,
                          isReceive: false,
                          productId: data.wait[index].product.id,
                          payment: data.wait[index].payment,
                        ),
                    separatorBuilder: (context, _) => const SizedBox(
                          height: 5,
                        ),
                    itemCount: data.wait.length),
                ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTransactions(
                          productId: data.unpaid[index].id,
                          iconData: Icons.error_outline,
                          iconColor: Colors.lightBlueAccent,
                          color: Colors.blue.shade50,
                          title: data.unpaid[index].title,
                          header: LocaleKeys.deliveryStatus_seller_unpaid.tr(),
                          price: data.unpaid[index].price,
                          photos: data.unpaid[index].photos,
                          barcode: false,
                          isReceive: false,
                        ),
                    separatorBuilder: (context, _) => const SizedBox(
                          height: 5,
                        ),
                    itemCount: data.unpaid.length),
                ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTransactions(
                          productId: data.seller[index].product.id,
                          iconColor: Colors.green,
                          iconData: Icons.check_circle_outline_outlined,
                          color: const Color(0xFFC4B5FD),
                          header: LocaleKeys.deliveryStatus_seller_seller.tr(),
                          title: data.seller[index].product.title,
                          price: data.seller[index].product.price,
                          photos: data.seller[index].product.photos,
                          sellerDate: data.seller[index].sellerDate,
                          barcode: false,
                          isReceive: false,
                        ),
                    separatorBuilder: (context, _) => const SizedBox(
                          height: 5,
                        ),
                    itemCount: data.seller.length),
                ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTransactions(
                          productId: data.customer[index].product.id,
                          iconColor: Colors.green,
                          iconData: Icons.check_circle_outline_outlined,
                          color: const Color(0xFFC4B5FD),
                          header:
                              LocaleKeys.deliveryStatus_customer_customer.tr(),
                          title: data.customer[index].product.title,
                          price: data.customer[index].product.price,
                          photos: data.customer[index].product.photos,
                          sellerDate: data.customer[index].sellerDate,
                          customerDate: data.customer[index].customerDate,
                          barcode: false,
                          isReceive: false,
                        ),
                    separatorBuilder: (context, _) => const SizedBox(
                          height: 5,
                        ),
                    itemCount: data.customer.length),
              ],
            ),
          ),
        );
      },
    );
  }
}
