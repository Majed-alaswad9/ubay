import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/my_transactions/data/model/purchases_model/purchases_model.dart';

import '../../../../core/common/model/page_state/result_builder.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../app/presentation/widgets/loading_indicator.dart';
import '../bloc/transactions_bloc.dart';
import '../widget/card_sales.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({super.key});

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  @override
  void initState() {
    context.read<TransactionsBloc>().add(GetAllPurchasesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        return PageStateBuilder<PurchasesModel>(
          loading: const Center(child: LoadingIndicator()),
          init: const SizedBox.shrink(),
          empty: Center(
            child: Text(LocaleKeys.no_data.tr()),
          ),
          error: (error) => Center(
            child: Text(error.toString()),
          ),
          result: state.allPurchases,
          success: (data) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<TransactionsBloc>().add(GetAllPurchasesEvent());
              },
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  ListView.separated(
                      padding: HWEdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTransactions(
                            iconColor: Colors.orangeAccent,
                            iconData: Icons.warning_amber,
                            color: context.colorScheme.errorContainer,
                            header:
                                LocaleKeys.deliveryStatus_customer_seller.tr(),
                            title: data.seller[index].product.title,
                            price: data.seller[index].product.price,
                            photos: data.seller[index].product.photos,
                            barcode: true,
                            isReceive: true,
                            productId: data.seller[index].product.id,
                            payment: data.seller[index].payment,
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
                            productId: data.wait[index].product.id,
                            iconData: Icons.info_outline,
                            iconColor: const Color(0xFF0288D1),
                            color: const Color(0xFFC4B5FD),
                            title: data.wait[index].product.title,
                            header:
                                LocaleKeys.deliveryStatus_customer_wait.tr(),
                            price: data.wait[index].product.price,
                            photos: data.wait[index].product.photos,
                            barcode: false,
                            isReceive: false,
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
                            productId: data.customer[index].product.id,
                            iconColor: Colors.green,
                            iconData: Icons.check_circle_outline_outlined,
                            color: const Color(0xFFC4B5FD),
                            header: LocaleKeys.deliveryStatus_customer_customer
                                .tr(),
                            title: data.customer[index].product.title,
                            price: data.customer[index].product.price,
                            photos: data.customer[index].product.photos,
                            barcode: false,
                            isReceive: false,
                          ),
                      separatorBuilder: (context, _) => const SizedBox(
                            height: 5,
                          ),
                      itemCount: data.customer.length),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
