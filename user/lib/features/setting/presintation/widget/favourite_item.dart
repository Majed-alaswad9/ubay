import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/core/config/themes/my_color_scheme.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';

class FilterTypeItem extends StatelessWidget {
  final String title;
  final bool active;
  final VoidCallback? onTap;
  const FilterTypeItem(this.title,
      {super.key, this.active = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsetsDirectional.only(
                  start: 12, top: 10, bottom: 10),
              width: 136.w,
              decoration: BoxDecoration(
                color: active
                    ? context.colorScheme.primary.withOpacity(.07)
                    : null,
                borderRadius: BorderRadius.circular(8),
              ),
              child: AppTextView(
                title,
                style: context.textTheme.bodyMedium.withColor(active
                    ? context.colorScheme.primary
                    : context.colorScheme.grey),
              ),
            ),
            if (active)
              CustomPaint(
                painter: TagPainter(),
                child: const SizedBox(width: 15, height: 15),
              ),
          ],
        ),
      ),
    );
  }
}

class TagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(18, 251, 84, 7)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width, size.height / 2)
      ..lineTo(0, 0)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
