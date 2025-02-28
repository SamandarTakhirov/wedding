import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/context_utils.dart';
import '../../../router/app_route.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    required this.isCompact,
  });
  final bool isCompact;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  void logout() => showCupertinoDialog<BuildContext>(
        context: context,
        barrierDismissible: true,
        builder: (context) => CupertinoAlertDialog(
          title: const Text(
            'Chiqish',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('Haqiqatan ham tizimdan chiqishni xohlaysizmi?'),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Bekor qilish', style: TextStyle(color: AppColors.black)),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                // Logout logikasi
                context.pushReplacementNamed(Routes.initial);
              },
              child: const Text('Chiqish'),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => widget.isCompact
      ? InkWell(
          onTap: logout,
          child: const CircleAvatar(
            backgroundColor: AppColors.grey,
            child: Icon(
              Icons.logout,
              color: AppColors.white,
            ),
          ),
        )
      : SizedBox(
          height: 50,
          width: context.width,
          child: Row(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: logout,
                child: const CircleAvatar(
                  backgroundColor: AppColors.purple,
                  child: Icon(
                    Icons.logout,
                    color: AppColors.white,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Samandar Takhirov',
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text('ID: 0987654321'),
                ],
              )
            ],
          ),
        );
}
