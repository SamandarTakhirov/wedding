import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/utils/context_utils.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget({
    required this.address,
    this.fontName = 'GreatVibes',
    this.color = AppColors.yellowTemplateColor,
    super.key,
  });

  final String address;
  final String fontName;
  final Color color;

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(2),
        child: Text(
          'Manzil: ${widget.address}',
          textAlign: TextAlign.center,
          style: context.textTheme.headlineLarge?.copyWith(
            color: widget.color,
            fontFamily: widget.fontName,
          ),
        ),
      );
}
