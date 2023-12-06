import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:user/core/common/model/page_state/bloc_status.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/app/presentation/widgets/app_elevated_button.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_field.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/setting/domain/usecase/change_password_use_case.dart';
import 'package:user/features/setting/presintation/bloc/setting_bloc.dart';
import 'package:user/generated/locale_keys.g.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController currentPasswordController =
      TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      resizeToAvoidBottomInset: false,
      appBar: UBayAppBar(
          isLeading: true,
          appBarParams: AppBarParams(
              title: LocaleKeys.settings_change_password.tr(),
              tittleStyle:
                  context.textTheme.titleMedium!.withColor(Colors.white))),
      body: ListView(
        padding: HWEdgeInsets.only(
            right: 16,
            left: 16,
            top: MediaQuery.of(context).viewInsets.top + 50,
            bottom: MediaQuery.of(context).viewInsets.bottom + 50),
        children: [
          FormBuilder(
              key: _formkey,
              child: Column(
                children: [
                  AppTextField(
                    name: 'currentPassword',
                    controller: currentPasswordController,
                    title: LocaleKeys.settings_current_password.tr(),
                    hintText: LocaleKeys.settings_enter_current_password.tr(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: LocaleKeys
                              .validation_can_not_be_empty_please_enter_correct_password
                              .tr()),
                      FormBuilderValidators.minLength(6,
                          errorText: LocaleKeys
                              .validation_enter_at_least_num_characters
                              .tr())
                    ]),
                  ),
                  12.verticalSpace,
                  AppTextField(
                    name: 'password',
                    controller: passwordController,
                    title: LocaleKeys.login_screen_Password.tr(),
                    hintText: LocaleKeys.login_screen_EnterYourPassword.tr(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: LocaleKeys
                              .validation_can_not_be_empty_please_enter_correct_password
                              .tr()),
                      FormBuilderValidators.minLength(6,
                          errorText: LocaleKeys
                              .validation_enter_at_least_num_characters
                              .tr())
                    ]),
                  ),
                ],
              )),
          15.verticalSpace,
          BlocSelector<SettingBloc, SettingState, BlocStatus>(
              selector: (state) => state.changePasswordStatus,
              builder: (context, state) {
                return AppElevatedButton(
                  isLoading: state.isLoading(),
                  text: LocaleKeys.save.tr(),
                  onPressed: () async {
                    _formkey.currentState!.save();
                    _formkey.currentState!.validate();
                    if (_formkey.currentState!.isValid) {
                      context.read<SettingBloc>().add(ChangePasswordEvent(
                          ChangePasswordParams(currentPasswordController.text,
                              passwordController.text)));
                    }
                  },
                );
              })
        ],
      ),
    );
  }
}
