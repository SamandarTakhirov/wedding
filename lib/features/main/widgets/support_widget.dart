import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/context_utils.dart';
import '../../../core/utils/utils.dart';
import '../../../gen/assets.gen.dart';

class SupportWidget extends StatefulWidget {
  const SupportWidget({
    required this.isCompact,
    required this.onPressed,
    required this.fontSize,
    super.key,
  });

  final bool isCompact;
  final void Function() onPressed;
  final double fontSize;

  @override
  State<SupportWidget> createState() => _SupportWidgetState();
}

class _SupportWidgetState extends State<SupportWidget> {
  bool _isFlushbarVisible = false;

  void _showFlushbar() {
    if (_isFlushbarVisible) return;

    _isFlushbarVisible = true;
    Flushbar<Text>(
      message: 'Karta raqami nusxalandi',
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      backgroundGradient: const LinearGradient(
        colors: [
          AppColors.blueTemplateColor,
          AppColors.whiteBlue,
        ],
      ),
      icon: const Icon(
        Icons.copy,
        color: AppColors.white,
      ),
      onStatusChanged: (status) {
        if (status == FlushbarStatus.DISMISSED) {
          setState(() {
            _isFlushbarVisible = false;
          });
        }
      },
    ).show(context);
  }

  @override
  Widget build(BuildContext context) => widget.isCompact
      ? IconButton(
          alignment: Alignment.center,
          padding: AppUtils.kPadding0,
          onPressed: widget.onPressed,
          icon: Assets.svg.support.svg(
            color: AppColors.red,
            width: 24,
            height: 24,
          ),
        )
      : SizedBox(
          width: context.width,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: AppUtils.kBorderRadius24,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFEAABF0),
                  Color(0xFF4623E9),
                ],
              ),
            ),
            child: Padding(
              padding: AppUtils.kPaddingAll8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 20,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Oylik to’lov qilishingiz zarur!',
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: widget.fontSize * 0.009,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: InkWell(
                      onTap: () {
                        Clipboard.setData(
                          const ClipboardData(text: '1234 5678 1234 5678'),
                        );
                        _showFlushbar();
                      },
                      child: Text(
                        '1234 5678 1234 5678',
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: widget.fontSize * 0.012,
                        ),
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Karta orqali to’lov qilib\nTelegram Support orqali\naccountni foalashtiring!',
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: AppColors.white,
                        fontSize: widget.fontSize * 0.01,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: FilledButton(
                      onPressed: widget.onPressed,
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.white,
                      ),
                      child: const Text(
                        'Telegram Support',
                        style: TextStyle(
                          color: AppColors.purple,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
