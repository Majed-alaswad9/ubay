import 'package:flutter/material.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Center(
      child: AppTextView(style: context.textTheme.bodyMedium.s19, 'trans'),
    ));
  }
}
