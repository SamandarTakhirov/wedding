import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_colors.dart';
import '../../../core/utils/context_utils.dart';

class InfoItems extends StatelessWidget {
  const InfoItems({
    required this.iconName,
    required this.infoText,
    required this.totalPrice,
    super.key,
  });

  final String iconName;
  final String infoText;
  final String totalPrice;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.whiteGreen,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: SvgPicture.asset(
                iconName,
                height: 42,
                width: 42,
                color: Colors.green,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                infoText,
                style: context.textTheme.titleLarge?.copyWith(
                  color: AppColors.grey,
                ),
              ),
              Text(
                totalPrice,
                style: context.textTheme.displayMedium?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      );
}
