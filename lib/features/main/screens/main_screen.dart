import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_colors.dart';
import '../../../core/utils/context_utils.dart';
import '../../../gen/assets.gen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) => PopScope(
        canPop: widget.navigationShell.currentIndex != 0,
        onPopInvokedWithResult: (_, __) => widget.navigationShell.goBranch(0),
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: LayoutBuilder(
            builder: (context, constraints) {
              final isCompact = constraints.maxWidth < 600;
              return Stack(
                children: [
                  SizedBox.expand(child: widget.navigationShell),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Container(
                      width: isCompact ? 80 : 250,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 100,
                            offset: Offset(20, 0),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isCompact ? 'VIP' : 'TaklifnomaVIP',
                            style: context.textTheme.titleLarge?.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildMenuButton(
                            index: 0,
                            icon: Assets.svg.dashboard,
                            title: 'Dashboard',
                            context: context,
                            isCompact: isCompact,
                          ),
                          _buildMenuButton(
                            index: 1,
                            icon: Assets.svg.invitation,
                            title: 'Invitation',
                            context: context,
                            isCompact: isCompact,
                          ),
                          _buildMenuButton(
                            index: 2,
                            icon: Assets.svg.sales,
                            title: 'Sales',
                            context: context,
                            isCompact: isCompact,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );

  Widget _buildMenuButton({
    required int index,
    required SvgGenImage icon,
    required String title,
    required BuildContext context,
    required bool isCompact,
  }) {
    var isSelected = widget.navigationShell.currentIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: isSelected ? AppColors.purple : Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        ),
        onPressed: () => widget.navigationShell.goBranch(
          index,
          initialLocation: index == widget.navigationShell.currentIndex,
        ),
        child: Row(
          mainAxisAlignment: isCompact ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            icon.svg(
              color: isSelected ? Colors.white : AppColors.grey,
              width: 24,
              height: 24,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isCompact
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        title,
                        key: ValueKey(title),
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
