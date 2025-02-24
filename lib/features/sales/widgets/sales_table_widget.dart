import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/context_utils.dart';
import '../../../core/utils/utils.dart';

class SalesTableWidget extends StatefulWidget {
  const SalesTableWidget({super.key});

  @override
  State<SalesTableWidget> createState() => _SalesTableWidgetState();
}

class _SalesTableWidgetState extends State<SalesTableWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 700;

    return Padding(
      padding: AppUtils.kPaddingAll24,
      child: Center(
        child: SizedBox(
          width: screenWidth < 1500 ? screenWidth : 1500,
          height: context.height,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 100,
                  offset: Offset(40, 20),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final containerWidth = constraints.maxWidth * 0.9;
                  final fontSize = containerWidth * 0.05;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Oylik sotuvlar 01.03 - 01.04',
                            style: context.textTheme.headlineLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: fontSize * 0.7,
                            ),
                          ),
                          if (isSmallScreen)
                            IconButton(
                              icon: Icon(
                                CupertinoIcons.search,
                                color: AppColors.blue,
                                size: fontSize * .5,
                              ),
                              onPressed: () {},
                            )
                          else
                            SizedBox(
                              width: containerWidth * 0.3,
                              height: containerWidth * 0.05,
                              child: TextField(
                                cursorColor: AppColors.blue,
                                decoration: InputDecoration(
                                  contentPadding: AppUtils.kPadding0,
                                  prefixIcon: Icon(
                                    CupertinoIcons.search,
                                    size: fontSize * .3,
                                  ),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    fontSize: fontSize * .3,
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: AppColors.blue, width: 2),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: AppColors.grey),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
