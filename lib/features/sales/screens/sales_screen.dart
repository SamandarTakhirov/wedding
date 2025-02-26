import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/context_utils.dart';
import '../../../core/utils/utils.dart';
import '../../../gen/assets.gen.dart';
import '../../dashboard/widgets/info_items.dart';
import '../widgets/sales_table_widget.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Row(
          children: [
            SizedBox(
              width: context.width > 600 ? 250 : 80,
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      'Sotuvlar boshqaruvi',
                      style: context.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.width,
                    child: GridView.builder(
                      padding: AppUtils.kPaddingHor24,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 500,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 4,
                      ),
                      itemCount: 3,
                      itemBuilder: (context, index) => InfoItems(
                        svg: Assets.svg.user.svg(
                          color: AppColors.green,
                        ),
                        infoText: 'Barcha sotuvlar',
                        totalPrice: '300 ta',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.width,
                    height: context.height,
                    child: const SalesTableWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
