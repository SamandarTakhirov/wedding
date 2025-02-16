import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/utils/context_utils.dart';

class CustomRichtext extends StatelessWidget {
  const CustomRichtext({
    required this.mainText,
    required this.text,
    this.textStyle,
    super.key,
  });
  final String mainText;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
          style: textStyle ?? context.textTheme.bodyLarge?.copyWith(color: AppColors.blue),
          children: [
            TextSpan(
              text: mainText,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            TextSpan(
              text: text,
            ),
          ],
        ),
      );
}
