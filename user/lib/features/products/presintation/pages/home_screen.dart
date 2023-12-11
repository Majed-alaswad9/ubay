import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user/core/common/model/page_state/result_builder.dart';
import 'package:user/core/config/router/router.dart';
import 'package:user/core/config/themes/my_color_scheme.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/chose_date_time.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_pop_up_edit_delete.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/loading_indicator.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/photo_grid.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/products/data/model/posts_model.dart';
import 'package:user/features/products/presintation/pages/add_post_screen.dart';
import 'package:user/features/products/presintation/widget/comments_widget.dart';
import 'package:user/features/products/presintation/widget/like_button.dart';
import 'package:user/generated/locale_keys.g.dart';

import '../../../../core/common/constants/constants.dart';
import '../../../../core/util/responsive_padding.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _homeBloc;
  @override
  void initState() {
    _homeBloc = context.read<HomeBloc>();
    loadData();
    super.initState();
  }

  loadData() {
    _homeBloc.add(GetAllPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: UBayAppBar(
          isLeading: false,
          appBarParams: AppBarParams(
              title: LocaleKeys.home.tr(),
              backgroundColor: context.colorScheme.primary,
              tittleStyle: context.textTheme.titleMedium!
                  .withColor(context.colorScheme.white))),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return PageStateBuilder<PostsModel>(
            init: const SizedBox.shrink(),
            success: (data) {
              return RefreshIndicator(
                backgroundColor: context.colorScheme.white,
                color: context.colorScheme.primary,
                onRefresh: () async {
                  loadData();
                },
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: HWEdgeInsets.all(2),
                  shrinkWrap: true,
                  itemCount: data.data!.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 2,
                  ),
                  itemBuilder: (context, index) => Card(
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
                                backgroundImage:
                                    NetworkImage(data.data![index].user!.photo),
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
                                      data.data![index].user!.name),
                                  5.verticalSpace,
                                  AppTextView(
                                      ChoseDateTime()
                                          .chose(data.data![index].createdAt),
                                      style: context.textTheme.titleSmall!
                                          .copyWith(
                                              fontSize: 10,
                                              color: context.colorScheme.grey))
                                ],
                              ),
                              10.horizontalSpace,
                              if (data.data![index].user!.id == user.id) ...[
                                const Spacer(),
                                PopUpMenuDeleteEdit(
                                  product: data.data![index],
                                  deleteFunction: () {
                                    context.read<HomeBloc>().add(
                                        DeleteProductEvent(
                                            data.data![index].id));
                                    if (state.deletePostOrComment.isSuccess()) {
                                      context.pop();
                                    }
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
                          InkWell(
                            onTap: () {
                              context.pushNamed(
                                  GRouter.config.homeScreen.viewProductScreen,
                                  extra: data.data![index]);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextView(data.data![index].title,
                                    style: context.textTheme.titleLarge),
                                10.verticalSpace,
                                AppTextView(data.data![index].content,
                                    style: context.textTheme.titleMedium),
                                10.verticalSpace,
                                if (data.data![index].coupons!.isEmpty)
                                  Container(
                                      padding: HWEdgeInsets.all(3.5),
                                      decoration: BoxDecoration(
                                          color: context.colorScheme.secondary,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: AppTextView(
                                          '${formatter.format(data.data![index].price)} ل س',
                                          style: context.textTheme.titleSmall!
                                              .withColor(
                                            Colors.white,
                                          ))),
                                if (data.data![index].coupons!.isNotEmpty) ...[
                                  Container(
                                      padding: HWEdgeInsets.all(3.5),
                                      decoration: BoxDecoration(
                                          color: context.colorScheme.secondary,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: AppTextView(
                                          '${formatter.format(data.data![index].price - data.data![index].coupons![0].discount!)} ل س',
                                          style: context.textTheme.titleSmall!
                                              .withColor(Colors.white))),
                                ],
                                10.verticalSpace,
                                SizedBox(
                                    width: double.infinity,
                                    height: data.data![index].photos.length < 3
                                        ? 250
                                        : 350,
                                    child: PhotoGrid(
                                        imageUrls: data.data![index].photos)),
                                2.verticalSpace,
                                Row(
                                  children: [
                                    if (data.data![index].comments != 0)
                                      AppTextView(
                                          '${data.data![index].comments} ${LocaleKeys.home_screen_comments.tr()}',
                                          style: context.textTheme.titleSmall),
                                    5.horizontalSpace,
                                    if (data.data![index].likes != 0)
                                      AppTextView(
                                          '${data.data![index].likes} ${LocaleKeys.home_screen_likes.tr()}',
                                          style: context.textTheme.titleSmall),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: LikeButton(
                                    postId: data.data![index].id,
                                    isLike: data.data![index].likedByMe),
                              ),
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {
                                    context.read<HomeBloc>().add(
                                        GetCommentsEvent(data.data![index].id));
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
                                              product: data.data![index],
                                              postId: data.data![index].id,
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
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            loading: const Center(
              child: LoadingIndicator(),
            ),
            error: (error) => Center(
              child: IconButton(
                  color: context.colorScheme.primary,
                  onPressed: () {
                    loadData();
                  },
                  icon: const Icon(
                    Icons.refresh,
                    size: 25,
                  )),
            ),
            empty: AppTextView(
              LocaleKeys.no_data.tr(),
              style: context.textTheme.bodyMedium.s17,
            ),
            result: state.allPosts!,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(GRouter.config.homeScreen.addPostScreen,
              extra: AddPostScreenParams(isUpdate: false));
        },
        backgroundColor: context.colorScheme.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
