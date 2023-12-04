import 'package:flutter/material.dart';
import 'package:user/core/util/extensions/build_context.dart';

import '../../../../core/util/responsive_padding.dart';
import '../../../app/presentation/widgets/app_text_view.dart';

Widget alignMessage(BuildContext context, BorderRadiusGeometry borderRadius,
        String message, Color color, Color messageColor,
        {AlignmentGeometry alignment = AlignmentDirectional.centerEnd}) =>
    Align(
      alignment: alignment,
      child: Container(
        padding: HWEdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(color: color, borderRadius: borderRadius),
        child: AppTextView(
          message,
          style: context.textTheme.bodyMedium!.copyWith(color: messageColor),
        ),
      ),
    );
