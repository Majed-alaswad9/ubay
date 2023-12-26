import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/core/common/model/page_state/result_builder.dart';
import 'package:user/core/config/themes/my_color_scheme.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/core_helper.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/show_message.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/loading_indicator.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/products/data/model/products_model.dart';
import 'package:user/features/products/presintation/widget/button_buying.dart';
import 'package:user/features/products/presintation/widget/button_coupon.dart';
import '../../../../core/common/constants/constants.dart';
import '../../../../core/util/chose_date_time.dart';
import '../../../../core/util/responsive_padding.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../app/presentation/widgets/app_pop_up_edit_delete.dart';
import '../../../app/presentation/widgets/app_text_view.dart';
import '../bloc/home_bloc.dart';
import '../widget/comments_widget.dart';
import '../widget/like_button.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key, required this.id});

  final String id;

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetProductEvent(widget.id));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: UBayAppBar(
          appBarParams: AppBarParams(),
          isLeading: true,
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.addPaymentStatus.isSuccess()) {
              showMessage(LocaleKeys.payment_success.tr(), isSuccess: true);
            } else if (state.addPaymentStatus.isFail()) {
              showMessage(LocaleKeys.payment_error.tr());
            }
          },
          builder: (context, state) => PageStateBuilder<Product>(
            loading: const Center(child: LoadingIndicator()),
            init: const SizedBox.shrink(),
            empty: AppTextView(LocaleKeys.no_data.tr(),
                style: context.textTheme.titleMedium),
            error: (error) => IconButton(
                onPressed: () {},
                icon: Center(
                  child: Icon(
                    Icons.refresh,
                    color: context.colorScheme.primary,
                  ),
                )),
            result: state.getProduct,
            success: (data) {
              return ListView(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  Card(
                    color: Colors.white,
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: HWEdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(data.user!.photo),
                                radius: 26,
                              ),
                              10.horizontalSpace,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextView(
                                      style: context.textTheme.titleSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                      data.user!.name),
                                  5.verticalSpace,
                                  AppTextView(
                                      ChoseDateTime().chose(data.createdAt),
                                      style: context.textTheme.titleSmall!
                                          .copyWith(
                                              fontSize: 10,
                                              color: context.colorScheme.grey))
                                ],
                              ),
                              10.horizontalSpace,
                              if (data.user!.id == user.id) ...[
                                const Spacer(),
                                PopUpMenuDeleteEdit(
                                  product: data,
                                  deleteFunction: () {
                                    context
                                        .read<HomeBloc>()
                                        .add(DeleteProductEvent(widget.id));
                                  },
                                  fromContext: context,
                                  isProduct: true,
                                  isCoupon: false,
                                )
                              ]
                            ],
                          ),
                          Divider(
                            color: context.colorScheme.grey,
                          ),
                          10.verticalSpace,
                          AppTextView(data.title,
                              style: context.textTheme.titleLarge),
                          10.verticalSpace,
                          AppTextView(data.content,
                              style: context.textTheme.titleMedium),
                          10.verticalSpace,
                          if (data.coupons!.isEmpty)
                            Container(
                                padding: HWEdgeInsets.all(3.5),
                                decoration: BoxDecoration(
                                    color: context.colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(5)),
                                child: AppTextView(
                                    '${LocaleKeys.home_screen_price.tr()} ${CoreHelper.handlePrice(CoreHelper.formatter.format(data.price))} ل س',
                                    style:
                                        context.textTheme.titleSmall!.withColor(
                                      Colors.white,
                                    ))),
                          if (data.coupons!.isNotEmpty) ...[
                            Container(
                                padding: HWEdgeInsets.all(3.5),
                                decoration: BoxDecoration(
                                    color: context.colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(5)),
                                child: AppTextView(
                                    'السعر بعد الحسم ${CoreHelper.handlePrice(CoreHelper.formatter.format(data.price - data.coupons![0].discount!))} ل س',
                                    style: context.textTheme.titleSmall!
                                        .withColor(Colors.white))),
                          ],
                          10.verticalSpace,
                          Row(
                            children: [
                              if (data.comments != 0)
                                AppTextView(
                                    '${data.comments} ${LocaleKeys.home_screen_comments.tr()}',
                                    style: context.textTheme.titleSmall),
                              8.horizontalSpace,
                              if (data.likes != 0)
                                AppTextView(
                                    '${data.likes} ${LocaleKeys.home_screen_likes.tr()}',
                                    style: context.textTheme.titleSmall),
                            ],
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: LikeButton(
                                    postId: data.id, isLike: data.likedByMe),
                              ),
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {
                                    context
                                        .read<HomeBloc>()
                                        .add(GetCommentsEvent(data.id));
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(16))),
                                        builder: (context) => SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.8,
                                            child: CommentsWidget(
                                              product: data,
                                              postId: widget.id,
                                            )));
                                  },
                                  child: Icon(
                                    Icons.comment,
                                    color: context.colorScheme.primary,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.telegram_sharp,
                                    size: 35,
                                    color: context.colorScheme.primary,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          Row(
                            children: [
                              if (data.user!.id == user.id)
                                ButtonCoupon(id: widget.id, price: data.price),
                              if (data.user!.id != user.id)
                                ButtonBuying(id: widget.id, price: data.price),
                            ],
                          ),
                          10.verticalSpace,
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Image.network(
                              data.photos[index],
                              fit: BoxFit.contain,
                            ),
                            separatorBuilder: (context, _) => 5.verticalSpace,
                            itemCount: data.photos.length,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
