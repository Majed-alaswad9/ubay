import 'package:flutter/material.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Padding(
      padding: HWEdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              AppTextView('settings', style: context.textTheme.titleSmall),
              const Spacer(),
              const Icon(Icons.arrow_back)
            ],
          ),
          const Divider(),
          Row(
            children: [
              AppTextView('favourites', style: context.textTheme.titleSmall),
              const Spacer(),
              const Icon(Icons.arrow_back)
            ],
          ),
        ],
      ),
    ));
  }
}
