import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_colors.dart';
import '../../../core/utils/context_utils.dart';
import '../../../core/utils/utils.dart';

class AdminInfoWidget extends StatelessWidget {
  const AdminInfoWidget({
    required this.svg,
    required this.infoText,
    required this.totalPrice,
    super.key,
  });

  final SvgPicture svg;
  final String infoText;
  final String totalPrice;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final containerWidth = constraints.maxWidth * 0.9;
          final iconSize = containerWidth * 0.2;
          final fontSize = containerWidth * 0.05;
          return SizedBox(
            height: 250,
            width: containerWidth,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 10,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: AppUtils.kPaddingAll10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: iconSize,
                      height: iconSize,
                      decoration: const BoxDecoration(
                        color: AppColors.whiteGreen,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      padding: EdgeInsets.all(iconSize * 0.25),
                      child: svg,
                    ),
                    AppUtils.kGap10,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              infoText,
                              style: context.textTheme.titleLarge?.copyWith(
                                fontSize: fontSize,
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              totalPrice,
                              style: context.textTheme.displayMedium?.copyWith(
                                fontSize: fontSize * 1.2,
                                color: AppColors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
}
