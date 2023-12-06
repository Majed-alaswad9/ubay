import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user/core/common/model/page_state/bloc_status.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_elevated_button.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_field.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/setting/presintation/bloc/setting_bloc.dart';
import 'package:user/generated/locale_keys.g.dart';

import '../../../../core/common/constants/constants.dart';
import '../../../../core/util/chose_date_time.dart';
import '../../../../core/util/header_curved.dart';
import '../../../../core/util/responsive_padding.dart';
import '../../../app/presentation/widgets/app_text_view.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});

  final TextEditingController nameController =
      TextEditingController(text: user.name);

  final TextEditingController emailController =
      TextEditingController(text: user.email);

  @override
  Widget build(BuildContext context) {
    final HeaderCurvedContainer headerCurvedContainer =
        HeaderCurvedContainer(context: context);
    return AppScaffold(
        appBar: UBayAppBar(
          isLeading: true,
          appBarParams: AppBarParams(
              title: LocaleKeys.profile.tr(),
              tittleStyle:
                  context.textTheme.titleMedium!.withColor(Colors.white)),
        ),
        body: ListView(
          children: [
            Card(
              child: CustomPaint(
                painter: headerCurvedContainer,
              ),
            ),
            150.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<SettingBloc, SettingState>(
                  builder: (context, state) {
                    return Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          backgroundImage: (state.photo != null)
                              ? Image(image: FileImage(state.photo!)).image
                              : NetworkImage(user.photo),
                          radius: 60.r,
                        ),
                        CircleAvatar(
                          backgroundColor: context.colorScheme.primary,
                          radius: 20,
                          child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(16))),
                                    builder: (context) => SizedBox(
                                        child: pickPhoto(context: context)));
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              )),
                        )
                      ],
                    );
                  },
                )
              ],
            ),
            Card(
              margin: HWEdgeInsets.all(10),
              color: Colors.white,
              child: Padding(
                padding: HWEdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextView(LocaleKeys.signup_screen_FullName.tr(),
                            style: context.textTheme.titleMedium!
                                .copyWith(color: context.colorScheme.primary)),
                        AppTextField(
                          name: 'name',
                          controller: nameController,
                          prefixIcon: Icon(
                            Icons.people,
                            color: context.colorScheme.primary,
                          ),
                        ),
                        10.verticalSpace,
                        AppTextView(LocaleKeys.login_screen_Email.tr(),
                            style: context.textTheme.titleMedium!
                                .copyWith(color: context.colorScheme.primary)),
                        AppTextField(
                          name: 'email',
                          controller: emailController,
                          prefixIcon: Icon(
                            Icons.email,
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    AppTextView(LocaleKeys.use_ago.tr(),
                        style: context.textTheme.titleMedium!
                            .copyWith(color: context.colorScheme.primary)),
                    AppTextView(ChoseDateTime().chose(user.createdAt),
                        style: context.textTheme.titleSmall),
                    10.verticalSpace
                  ],
                ),
              ),
            ),
            BlocSelector<SettingBloc, SettingState, BlocStatus>(
                selector: (state) => state.updateProfile,
                builder: (context, state) {
                  return Padding(
                    padding:
                        HWEdgeInsets.symmetric(vertical: 10, horizontal: 100),
                    child: AppElevatedButton(
                      onPressed: () {
                        context.read<SettingBloc>().add(EditMyProfileEvent(
                            name: nameController.text,
                            email: emailController.text));
                      },
                      text: LocaleKeys.save.tr(),
                      isLoading: state.isLoading(),
                    ),
                  );
                })
          ],
        ));
  }

  Widget pickPhoto({required BuildContext context}) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              context
                  .read<SettingBloc>()
                  .add(PickPhotoEvent(ImageSource.camera));
            },
            child: Padding(
              padding: HWEdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.camera_alt_outlined,
                      color: context.colorScheme.primary),
                  10.horizontalSpace,
                  AppTextView(LocaleKeys.camera.tr(),
                      style: context.textTheme.titleMedium)
                ],
              ),
            ),
          ),
          5.verticalSpace,
          const Divider(),
          5.verticalSpace,
          InkWell(
              onTap: () {
                context
                    .read<SettingBloc>()
                    .add(PickPhotoEvent(ImageSource.gallery));
              },
              child: Padding(
                padding: HWEdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.photo_library_sharp,
                        color: context.colorScheme.primary),
                    10.horizontalSpace,
                    AppTextView(LocaleKeys.gallery.tr(),
                        style: context.textTheme.titleMedium)
                  ],
                ),
              )),
        ],
      );
}
