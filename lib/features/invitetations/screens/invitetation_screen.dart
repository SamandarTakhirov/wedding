import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/context_utils.dart';
import '../widgets/templates_item.dart';

class InvitetationScreen extends StatefulWidget {
  const InvitetationScreen({super.key});

  @override
  State<InvitetationScreen> createState() => _InvitetationScreenState();
}

class _InvitetationScreenState extends State<InvitetationScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              width: context.width > 600 ? 250 : 80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    'Taklifnomalar Katologi',
                    style: context.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  children: List.generate(
                    10,
                    (index) => const TemplatesItem(),
                  ),
                )
              ],
            )
          ],
        ),
      );
}
