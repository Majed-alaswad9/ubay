import 'package:flutter/material.dart';
import 'package:user/core/util/extensions/build_context.dart';

import '../../../app/presentation/widgets/app_text_view.dart';

class CardSettings extends StatelessWidget {
  const CardSettings({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: AppTextView(title,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyLarge),
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward_rounded)
      ],
    );
  }
}
