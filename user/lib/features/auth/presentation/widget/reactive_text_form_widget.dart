import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/theme.dart';


// ignore: must_be_immutable
class ReactiveTextFiledWidget extends StatelessWidget {
  final String controller;
  final String labelText;
  void Function()? onPressed;
  IconData? prefixIcon;
  final IconData suffixIcon;
  final bool obscureText;

   ReactiveTextFiledWidget(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.suffixIcon,
      required this.obscureText,
      this.prefixIcon
      });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ReactiveTextField(
        formControlName: controller,
        validationMessages: {
          'required': (error) => 'حقل $controllerلا يجب أن يكون فارغاً',
          ValidationMessage.email:(error)=>'بريد الكتروني غير صالح',
          ValidationMessage.minLength:(error)=>'كلمة المرور يجب أن تكون على الأقل 8 رموز',
          ValidationMessage.mustMatch:(error)=>'لا يوجد تطابق'

        },
        decoration: InputDecoration(
            alignLabelWithHint: true,
            prefixIcon: IconButton(
              onPressed: onPressed,
              icon: Icon(prefixIcon),
              color: primaryColor,
            ),
            labelText: labelText,
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: primaryColor),
            suffixIcon: Icon(
              color: primaryColor,
              suffixIcon,
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
              borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
            ),
            contentPadding: const EdgeInsets.all(10)),
      ),
    );
  }
}
