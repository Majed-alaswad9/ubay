import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/common/model/page_state/result_builder.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/loading_indicator.dart';
import 'package:user/features/my_transactions/data/model/sales_model/sales_model.dart';
import 'package:user/features/my_transactions/presintation/widget/card_sales.dart';
import 'package:user/generated/locale_keys.g.dart';

import '../bloc/transactions_bloc.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        return PageStateBuilder<SalesModel>(
          loading: const LoadingIndicator(),
          init: const SizedBox.shrink(),
          empty: Center(
            child: Text(LocaleKeys.no_data.tr()),
          ),
          error: (error) => Center(
            child: Text(error.toString()),
          ),
          result: state.allSales,
          success: (data) => Column(
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.warning_amber,
                        color: Colors.orangeAccent,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        color: const Color(0xFFF9A8D4),
                        child: AppTextView(
                          LocaleKeys.deliveryStatus_seller_wait.tr(),
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CardSales(
                            title: data.wait[index].product.title,
                            price: data.wait[index].product.price,
                            photos: data.wait[index].product.photos,
                            wait: true,
                          ),
                      separatorBuilder: (context, _) => const SizedBox(
                            height: 5,
                          ),
                      itemCount: data.wait.length),
                ],
              ),
              Stack(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Color(0xFF8B5CF6),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        color: const Color(0xFFC4B5FD),
                        child: AppTextView(
                          LocaleKeys.deliveryStatus_seller_unpaid.tr(),
                          style: context.textTheme.bodyMedium!
                              .copyWith(color: const Color(0xFF8B5CF6)),
                        ),
                      ),
                    ],
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CardSales(
                            title: data.unpaid[index].title,
                            price: data.unpaid[index].price,
                            photos: data.unpaid[index].photos,
                            wait: false,
                          ),
                      separatorBuilder: (context, _) => const SizedBox(
                            height: 5,
                          ),
                      itemCount: data.unpaid.length),
                ],
              ),
              Stack(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline_outlined,
                        color: Colors.green,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        color: const Color(0xFFC4B5FD),
                        child: AppTextView(
                          LocaleKeys.deliveryStatus_seller_seller.tr(),
                          style: context.textTheme.bodyMedium!
                              .copyWith(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CardSales(
                            title: data.seller[index].product.title,
                            price: data.seller[index].product.price,
                            photos: data.seller[index].product.photos,
                            wait: false,
                          ),
                      separatorBuilder: (context, _) => const SizedBox(
                            height: 5,
                          ),
                      itemCount: data.seller.length),
                ],
              ),
              Stack(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline_outlined,
                        color: Colors.green,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        color: const Color(0xFFC4B5FD),
                        child: AppTextView(
                          LocaleKeys.deliveryStatus_customer_customer.tr(),
                          style: context.textTheme.bodyMedium!
                              .copyWith(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CardSales(
                            title: data.customer[index].product.title,
                            price: data.customer[index].product.price,
                            photos: data.customer[index].product.photos,
                            wait: false,
                          ),
                      separatorBuilder: (context, _) => const SizedBox(
                            height: 5,
                          ),
                      itemCount: data.customer.length),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
