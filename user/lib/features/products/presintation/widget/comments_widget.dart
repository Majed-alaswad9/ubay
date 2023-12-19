import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/core/common/model/page_state/bloc_status.dart';
import 'package:user/core/common/model/page_state/result_builder.dart';
import 'package:user/core/config/themes/my_color_scheme.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/app/presentation/widgets/app_pop_up_coupon.dart';
import 'package:user/features/app/presentation/widgets/app_text_field.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/loading_indicator.dart';
import 'package:user/features/products/data/model/posts_model.dart';
import 'package:user/generated/locale_keys.g.dart';

import '../../../../core/common/constants/constants.dart';
import '../../../../core/util/chose_date_time.dart';
import '../../../app/presentation/widgets/app_pop_up_edit_delete.dart';
import '../../data/model/comments_model/comments_model.dart';
import '../bloc/home_bloc.dart';

class CommentsWidget extends StatefulWidget {
  const CommentsWidget({
    super.key,
    required this.postId,
    required this.product,
  });

  final Data product;
  final String postId;

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  bool isUpdate = false;
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController commentController = TextEditingController();

  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.addComment.isSuccess()) {
          commentController.text = '';
        }
      },
      child: Column(
        children: [
          Padding(
            padding: HWEdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: FormBuilder(
                    key: _formkey,
                    child: AppTextField(
                      name: 'comment',
                      controller: commentController,
                      hintText: LocaleKeys.home_screen_write_comment.tr(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                BlocSelector<HomeBloc, HomeState, BlocStatus>(
                  selector: (state) => state.addComment,
                  builder: (context, state) => ConditionalBuilder(
                    condition: !state.isLoading(),
                    builder: (context) => IconButton(
                        onPressed: () {
                          _formkey.currentState!.save();
                          _formkey.currentState!.validate();
                          if (_formkey.currentState!.isValid) {
                            context.read<HomeBloc>().add(AddCommentEvent(
                                commentController.text,
                                user.id,
                                widget.postId));
                          }
                        },
                        icon: Icon(
                          Icons.send,
                          color: context.colorScheme.primary,
                        )),
                    fallback: (context) => LoadingIndicator(dimension: 20.r),
                  ),
                )
              ],
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return PageStateBuilder<CommentsModel>(
                  init: const SizedBox.shrink(),
                  success: (data) {
                    return ListView.builder(
                        padding: HWEdgeInsets.all(10),
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              color: context.colorScheme.white,
                              elevation: 2,
                              child: Padding(
                                padding: HWEdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              data.data![index].user.photo),
                                          radius: 24,
                                        ),
                                        10.horizontalSpace,
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppTextView(
                                                style: context
                                                    .textTheme.titleSmall!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                data.data![index].user.name),
                                            5.verticalSpace,
                                            AppTextView(
                                                ChoseDateTime().chose(data
                                                    .data![index].createdAt),
                                                style: context
                                                    .textTheme.titleSmall!
                                                    .copyWith(
                                                        fontSize: 10,
                                                        color: context
                                                            .colorScheme.grey))
                                          ],
                                        ),
                                        const Spacer(),
                                        if (data.data![index].user.id ==
                                            user.id)
                                          PopUpMenuDeleteEdit(
                                            deleteFunction: () {
                                              context.read<HomeBloc>().add(
                                                  DeleteCommentEvent(
                                                      data.data![index].id,
                                                      widget.postId));
                                              if (state.deletePostOrComment
                                                  .isSuccess()) {
                                                Navigator.pop(context,
                                                    LocaleKeys.yes.tr());
                                              }
                                            },
                                            fromContext: context,
                                            isProduct: false,
                                            isCoupon: false,
                                          )
                                        else if (widget.product.user!.id ==
                                            user.id)
                                          PopUpMenuCoupon(
                                            title:
                                                '${LocaleKeys.coupon_add_a_discount_for_the_item.tr()} ${widget.product.title}',
                                            priceProduct: widget.product.price,
                                            context: context,
                                            userName:
                                                data.data![index].user.name,
                                            userPhoto:
                                                data.data![index].user.photo,
                                          )
                                      ],
                                    ),
                                    16.verticalSpace,
                                    AppTextView(data.data![index].content,
                                        style: context.textTheme.titleMedium)
                                  ],
                                ),
                              ),
                            ),
                        itemCount: data.data!.length);
                  },
                  loading: Center(
                      child: LoadingIndicator(
                    dimension: 40.r,
                  )),
                  error: (error) {
                    return Text(error.toString());
                  },
                  result: state.commentsStatus,
                  empty: Center(
                    child: AppTextView(
                      LocaleKeys.no_data.tr(),
                      style: context.textTheme.titleMedium,
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
