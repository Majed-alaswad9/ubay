import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:user/features/auth/data/model/login_model/login_model.dart';

const Size designSize = Size(375, 812);

final formatter = NumberFormat('###,###,000');
late UserModel user;

typedef Json = Map<String, dynamic>;
