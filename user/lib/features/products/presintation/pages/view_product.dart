import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/core/config/themes/my_color_scheme.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/products/data/model/posts_model.dart';
import '../../../../core/common/constants/constants.dart';
import '../../../../core/util/chose_date_time.dart';
import '../../../../core/util/responsive_padding.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../app/presentation/widgets/app_pop_up_edit_delete.dart';
import '../../../app/presentation/widgets/app_text_view.dart';
import '../bloc/home_bloc.dart';
import '../widget/comments_widget.dart';
import '../widget/like_button.dart';

class ViewProduct extends StatelessWidget {
  const ViewProduct({super.key, required this.product});
  final Data product;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: UBayAppBar(
          appBarParams: AppBarParams(),
          isLeading: true,
        ),
        body: ListView(
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
                          backgroundImage: NetworkImage(product.user!.photo),
                          radius: 26,
                        ),
                        10.horizontalSpace,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextView(
                                style: context.textTheme.titleSmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                                product.user!.name),
                            5.verticalSpace,
                            AppTextView(
                                ChoseDateTime().chose(product.createdAt),
                                style: context.textTheme.titleSmall!.copyWith(
                                    fontSize: 10,
                                    color: context.colorScheme.grey))
                          ],
                        ),
                        10.horizontalSpace,
                        if (product.user!.id == user.id) ...[
                          const Spacer(),
                          PopUpMenuDeleteEdit(
                            product: product,
                            deleteFunction: () {
                              context
                                  .read<HomeBloc>()
                                  .add(DeleteProductEvent(product.id));
                            },
                            fromContext: context,
                            isProduct: true,
                          )
                        ]
                      ],
                    ),
                    Divider(
                      color: context.colorScheme.grey,
                    ),
                    10.verticalSpace,
                    AppTextView(product.title,
                        style: context.textTheme.titleLarge),
                    10.verticalSpace,
                    AppTextView(product.content,
                        style: context.textTheme.titleMedium),
                    10.verticalSpace,
                    if (product.coupons!.isEmpty)
                      Container(
                          padding: HWEdgeInsets.all(3.5),
                          decoration: BoxDecoration(
                              color: context.colorScheme.secondary,
                              borderRadius: BorderRadius.circular(5)),
                          child: AppTextView(
                              '${formatter.format(product.price)} ل س',
                              style: context.textTheme.titleSmall!.withColor(
                                Colors.white,
                              ))),
                    if (product.coupons!.isNotEmpty) ...[
                      Container(
                          padding: HWEdgeInsets.all(3.5),
                          decoration: BoxDecoration(
                              color: context.colorScheme.secondary,
                              borderRadius: BorderRadius.circular(5)),
                          child: AppTextView(
                              '${formatter.format(product.price - product.coupons![0].discount!)} ل س',
                              style: context.textTheme.titleSmall!
                                  .withColor(Colors.white))),
                    ],
                    10.verticalSpace,
                    if (product.comments != 0)
                      AppTextView(
                          '${product.comments} ${LocaleKeys.home_screen_comments.tr()}',
                          style: context.textTheme.titleSmall),
                    if (product.likes != 0)
                      AppTextView(
                          '${product.likes} ${LocaleKeys.home_screen_likes.tr()}',
                          style: context.textTheme.titleSmall),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: LikeButton(
                              postId: product.id, isLike: product.likedByMe),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              context
                                  .read<HomeBloc>()
                                  .add(GetCommentsEvent(product.id));
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(16))),
                                  builder: (context) => SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      child: CommentsWidget(
                                        product: product,
                                        postId: product.id,
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
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Image.network(
                        product.photos[index],
                        fit: BoxFit.contain,
                      ),
                      separatorBuilder: (context, _) => 5.verticalSpace,
                      itemCount: product.photos.length,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
