import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:user/core/common/model/page_state/result_builder.dart';
import 'package:user/core/config/router/router.dart';
import 'package:user/core/config/themes/my_color_scheme.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/chose_date_time.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/domain/repository/prefs_repository.dart';
import 'package:user/features/app/presentation/widgets/app_drop_down.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/loading_indicator.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/photo_grid.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/posts/presintation/widget/comments_widget.dart';
import 'package:user/features/posts/presintation/widget/like_button.dart';
import 'package:user/generated/locale_keys.g.dart';

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
              tittleStyle: context.textTheme.titleLarge!
                  .copyWith(color: context.colorScheme.white))),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return PageStateBuilder(
            init: const SizedBox.shrink(),
            success: (data) {
              return RefreshIndicator(
                backgroundColor: context.colorScheme.white,
                color: context.colorScheme.primary,
                onRefresh: () async {
                  loadData();
                },
                child: ListView.separated(
                  padding: HWEdgeInsets.all(2),
                  shrinkWrap: true,
                  itemCount: data.data.length,
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
                                    NetworkImage(data.data[index].user!.photo),
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
                                      data.data[index].user!.name),
                                  5.verticalSpace,
                                  AppTextView(
                                      ChoseDateTime()
                                          .chose(data.data[index].createdAt),
                                      style: context.textTheme.titleSmall!
                                          .copyWith(
                                              fontSize: 10,
                                              color: context.colorScheme.grey))
                                ],
                              ),
                              10.horizontalSpace,
                              if (data.data[index].user!.id ==
                                  GetIt.I<PrefsRepository>().user!.user.id) ...[
                                const Spacer(),
                                PopUpMenuBottom(deleteFunction: () {})
                              ]
                            ],
                          ),
                          Divider(
                            color: context.colorScheme.grey,
                          ),
                          10.verticalSpace,
                          AppTextView(data.data[index].title,
                              style: context.textTheme.titleLarge),
                          10.verticalSpace,
                          AppTextView(data.data[index].content,
                              style: context.textTheme.titleMedium),
                          10.verticalSpace,
                          Container(
                              padding: HWEdgeInsets.all(3.5),
                              decoration: BoxDecoration(
                                  color: context.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(5)),
                              child: AppTextView(
                                  '${data.data[index].price} ل س',
                                  style: context.textTheme.titleSmall!
                                      .copyWith(color: Colors.white))),
                          10.verticalSpace,
                          PhotoGrid(imageUrls: data.data[index].photos),
                          2.verticalSpace,
                          Row(
                            children: [
                              if (data.data[index].comments != 0)
                                AppTextView(
                                    '${data.data[index].comments} ${LocaleKeys.comments.tr()}',
                                    style: context.textTheme.titleSmall),
                              5.horizontalSpace,
                              if (data.data[index].likes != 0)
                                AppTextView(
                                    '${data.data[index].likes} ${LocaleKeys.likes.tr()}',
                                    style: context.textTheme.titleSmall)
                            ],
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: LikeButton(
                                    postId: data.data[index].id,
                                    isLike: data.data[index].likedByMe),
                              ),
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {
                                    context.read<HomeBloc>().add(
                                        GetCommentsEvent(data.data[index].id));
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
                                              postId: data.data[index].id,
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
                                    Icons.send,
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
              'No Data',
              style: context.textTheme.bodyMedium.s17,
            ),
            result: state.allPosts,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(GRouter.config.homeScreen.addPostScreen);
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
