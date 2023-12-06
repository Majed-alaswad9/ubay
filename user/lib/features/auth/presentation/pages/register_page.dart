import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:user/core/common/model/page_state/bloc_status.dart';
import 'package:user/core/config/router/router.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/app/presentation/widgets/app_elevated_button.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_field.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:user/generated/locale_keys.g.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static final GlobalKey<FormBuilderState> _formkey =
      GlobalKey<FormBuilderState>();
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.signupStatus.isSuccess()) {
          context.goNamed(GRouter.config.homeScreen.homeScreen);
        }
      },
      child: AppScaffold(
        resizeToAvoidBottomInset: false,
        appBar: UBayAppBar(
          appBarParams: AppBarParams(
              title: LocaleKeys.signup_screen_title,
              tittleStyle:
                  context.textTheme.titleMedium!.withColor(Colors.white)),
          isLeading: true,
        ),
        body: ListView(
          padding: HWEdgeInsets.only(
              left: 16,
              right: 16,
              top: MediaQuery.of(context).viewInsets.top + 50),
          children: [
            FormBuilder(
                key: _formkey,
                child: Column(
                  children: [
                    AppTextField(
                      controller: fullNameController,
                      textInputType: TextInputType.name,
                      name: 'name',
                      title: LocaleKeys.signup_screen_FullName.tr(),
                      hintText: LocaleKeys.signup_screen_EnterYourFullName.tr(),
                      maxLines: 1,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: LocaleKeys
                                .validation_this_field_is_required
                                .tr()),
                      ]),
                    ),
                    20.verticalSpace,
                    AppTextField(
                      controller: emailController,
                      name: 'email',
                      textInputType: TextInputType.emailAddress,
                      title: LocaleKeys.login_screen_Email.tr(),
                      hintText: LocaleKeys.login_screen_EnterYourEmail.tr(),
                      maxLines: 1,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: LocaleKeys
                                .validation_this_field_is_required
                                .tr()),
                        FormBuilderValidators.email(
                            errorText: LocaleKeys
                                .validation_please_enter_a_valid_email
                                .tr()),
                        // FormBuilderValidators.email(errorText: LocaleKeys.validation_please_enter_a_valid_email.tr())
                      ]),
                    ),
                    20.verticalSpace,
                    AppTextField(
                      controller: passwordController,
                      name: 'password',
                      textInputType: TextInputType.visiblePassword,
                      isPasswordFiled: true,
                      hintText: LocaleKeys.login_screen_Password.tr(),
                      labelText: LocaleKeys.login_screen_EnterYourPassword.tr(),
                      maxLines: 1,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: LocaleKeys
                                .validation_this_field_is_required
                                .tr()),
                        FormBuilderValidators.minLength(6,
                            errorText: LocaleKeys
                                .validation_enter_at_least_num_characters
                                .tr())
                        // FormBuilderValidators.email(errorText: LocaleKeys.validation_please_enter_a_valid_email.tr())
                      ]),
                    ),
                    20.verticalSpace,
                    AppTextField(
                      controller: rePasswordController,
                      name: 'rePasswordController',
                      textInputType: TextInputType.visiblePassword,
                      isPasswordFiled: true,
                      hintText: LocaleKeys.login_screen_Password.tr(),
                      labelText: LocaleKeys.signup_screen_rewrite_password.tr(),
                      maxLines: 1,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: LocaleKeys
                                .validation_this_field_is_required
                                .tr()),
                        FormBuilderValidators.match(passwordController.text,
                            errorText: LocaleKeys
                                .validation_can_not_be_empty_please_enter_correct_password
                                .tr())
                        // FormBuilderValidators.email(errorText: LocaleKeys.validation_please_enter_a_valid_email.tr())
                      ]),
                    ),
                  ],
                )),
            20.verticalSpace,
            BlocSelector<AuthBloc, AuthState, BlocStatus>(
                selector: (state) => state.signupStatus,
                builder: (context, state) {
                  return AppElevatedButton(
                    text: LocaleKeys.signup,
                    isLoading: state.isLoading(),
                    onPressed: () async {
                      _formkey.currentState!.save();
                      _formkey.currentState!.validate();
                      if (_formkey.currentState!.isValid) {
                        context.read<AuthBloc>().add(SignupEvent(
                            name: fullNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: rePasswordController.text));
                      }
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
