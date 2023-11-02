// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "home": "Home",
  "login": "Login",
  "signup": "Signup",
  "login_screen": {
    "Email": "Email",
    "EnterYourEmail": "Enter Your Email",
    "Password": "Password",
    "EnterYourPassword": "Enter Your Password",
    "ForgetPassword": "Forget Password?",
    "CreateAccount": "Create account"
  },
  "validation": {
    "enter_at_least_num_characters": "Enter at least 6 characters.",
    "this_field_is_required": "This field is required",
    "please_enter_a_valid_email": "Please enter a valid email",
    "this_field_can_not_be_empty": "this_field_can_not_be_empty",
    "can_not_be_empty_please_enter_correct_password": "can not be empty please enter correct password",
    "password_and_confirmation_password_mismatch": "password and confirmation password mismatch"
  },
  "signup_screen": {
    "title": "Create account",
    "rewrite_password": "rewrite password",
    "FullName": "Full Name",
    "EnterYourFullName": "Enter Your Full Name",
    "Email": "Email",
    "EnterYourEmail": "Enter Your Email",
    "Password": "Password",
    "EnterYourPassword": "Enter Your Password"
  },
  "date": {
    "ago": "ago",
    "minute": "minute",
    "second": "second",
    "hour": "hour",
    "day": "day"
  },
  "add_post_screen": {
    "new_post": "New Product",
    "add": "Add",
    "title": "title",
    "content": "content",
    "price": "price",
    "category": "category",
    "store": "store",
    "photos": "photos"
  },
  "delete_post": "Delete Post",
  "sure_delete": "Are you sure you want to delete this post?",
  "yes": "Yes",
  "edit": "Edit",
  "delete": "Delete",
  "cancel": "Cancel",
  "likes": "likes",
  "comments": "comments",
  "lbl_loading": "Loading..."
};
static const Map<String,dynamic> ar = {
  "home": "الرئيسية",
  "login": "تسجيل الدخول",
  "signup": "انشاء حساب",
  "login_screen": {
    "Email": "البريد الالكتروني",
    "EnterYourEmail": "ادخل البريد الالكتروني",
    "Password": "كلمة المرور",
    "EnterYourPassword": "ادخل كلمة المرور",
    "ForgetPassword": "نسيت كلمة المرور؟",
    "CreateAccount": "انشاء حساب"
  },
  "validation": {
    "enter_at_least_num_characters": "ادخل على الاقل 6 احرف ",
    "this_field_is_required": "هذا الحقل مطلوب ",
    "please_enter_a_valid_email": "   يرجى إدخال البريد الإلكتروني الصحيح. ",
    "this_field_can_not_be_empty": "هذا الحقل يجب ان لا يكون فارغ",
    "can_not_be_empty_please_enter_correct_password": "لا يمكن أن يكون فارغا الرجاء إدخال كلمة المرور الصحيحة",
    "password_and_confirmation_password_mismatch": "كلمة المرور وتأكيد كلمة المرور غير متطابقين"
  },
  "signup_screen": {
    "title": "إنشاء حساب",
    "rewrite_password": "إعادة كتابة كلمة المرور",
    "FullName": "الاسم كامل",
    "EnterYourFullName": "ادخل اسمك الكامل",
    "Email": "البريد الالكتروني",
    "EnterYourEmail": "ادخل البريد الالكتروني",
    "Password": "كلمة المرور",
    "EnterYourPassword": "ادخل كلمة المرور"
  },
  "date": {
    "ago": "منذ",
    "minute": "دقيقة",
    "second": "ثانية",
    "hour": "ساعة",
    "day": "يوم"
  },
  "add_post_screen": {
    "new_post": "قطعة جديدة",
    "add": "إضافة",
    "title": "العنوان",
    "content": "الوصف",
    "price": "السعر",
    "category": "الصنف",
    "store": "المستودع الذي ستسلم القطعة له",
    "photos": "الصور"
  },
  "delete_post": "حذف المنشور",
  "sure_delete": "هل انت متأكد من حذف هذا المنشور؟",
  "yes": "نعم",
  "edit": "تعديل",
  "cancel": "الغاء",
  "delete": "حذف",
  "likes": "إعجاب",
  "comments": "تعليق",
  "lbl_loading": " الرجاء الانتظار ..."
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}