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
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/generated/locale_keys.g.dart';
import '../bloc/auth/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.loginStatus.isSuccess()) {
          context.goNamed(GRouter.config.homeScreen.homeScreen);
        }
      },
      child: AppScaffold(
          resizeToAvoidBottomInset: false,
          appBar: UBayAppBar(
              appBarParams: AppBarParams(
                  title: LocaleKeys.login,
                  tittleStyle:
                      const TextStyle(fontSize: 20, color: Colors.white)),
              isLeading: false),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppTextField(
                      textInputType: TextInputType.emailAddress,
                      name: 'email',
                      controller: emailController,
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
                                .tr())
                      ]),
                    ),
                    20.verticalSpace,
                    AppTextField(
                      name: 'password',
                      controller: passwordController,
                      title: LocaleKeys.login_screen_Password.tr(),
                      hintText: LocaleKeys.login_screen_EnterYourPassword.tr(),
                      isPasswordFiled: true,
                      textAlignVertical: TextAlignVertical.center,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: LocaleKeys
                                .validation_this_field_is_required
                                .tr()),
                        FormBuilderValidators.minLength(6,
                            errorText: LocaleKeys
                                .validation_enter_at_least_num_characters
                                .tr()),
                      ]),
                    )
                  ],
                ),
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: AppTextView(
                      LocaleKeys.login_screen_ForgetPassword,
                      style: context.textTheme.labelMedium,
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                        context.pushNamed(GRouter.config.authRoutes.signup),
                    child: AppTextView(
                      LocaleKeys.login_screen_CreateAccount,
                      style: context.textTheme.labelMedium,
                    ),
                  )
                ],
              ),
              30.verticalSpace,
              BlocSelector<AuthBloc, AuthState, BlocStatus>(
                  selector: (state) => state.loginStatus,
                  builder: (context, state) {
                    return AppElevatedButton(
                      text: LocaleKeys.login,
                      textStyle: context.textTheme.titleSmall.s17,
                      isLoading: state.isLoading(),
                      onPressed: () async {
                        print(emailController.text);
                        _formkey.currentState!.save();
                        _formkey.currentState!.validate();
                        print(_formkey.currentState!.value);
                        if (_formkey.currentState!.isValid) {
                          context.read<AuthBloc>().add(LoginEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ));
                        }
                      },
                    );
                  })
            ],
          )),
    );
  }
}
