import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/utils/utils.dart';

class EditablePriceCell extends StatefulWidget {
  const EditablePriceCell({
    super.key,
    // Yangi parametrlar
    required this.isEditing,
    required this.onStartEditing,
    required this.onStopEditing,
    required this.onPriceChanged,
    required this.priceNotifier,
    required this.minPrice,
    required this.textStyle,
    required this.editingTextStyle,
  });
  final bool isEditing;
  final VoidCallback onStartEditing;
  final VoidCallback onStopEditing;
  final ValueChanged<double> onPriceChanged;
  final ValueNotifier<double> priceNotifier;
  final double minPrice;
  final TextStyle textStyle;
  final TextStyle editingTextStyle;

  @override
  EditablePriceCellState createState() => EditablePriceCellState();
}

class EditablePriceCellState extends State<EditablePriceCell> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.priceNotifier.value.toStringAsFixed(0));
  }

  @override
  void didUpdateWidget(covariant EditablePriceCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isEditing && oldWidget.isEditing) {
      _controller.text = widget.priceNotifier.value.toStringAsFixed(0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSubmitted(String value) {
    final newPrice = double.tryParse(value.replaceAll(' ', ''));
    if (newPrice != null && newPrice >= widget.minPrice) {
      widget.onPriceChanged(newPrice);
      widget.onStopEditing();
    } else {
      _controller.text = widget.priceNotifier.value.toStringAsFixed(0);
      widget.onStopEditing();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isEditing) {
      return SizedBox(
        width: 100,
        child: Padding(
          padding: AppUtils.kPaddingVer6,
          child: TextField(
            autofocus: true,
            controller: _controller,
            style: widget.editingTextStyle,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              contentPadding: AppUtils.kPadding0,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grey,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grey,
                ),
              ),
            ),
            onSubmitted: _onSubmitted,
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: widget.onStartEditing,
        child: ValueListenableBuilder<double>(
          valueListenable: widget.priceNotifier,
          builder: (context, price, _) => Text('${price.formattedPrice} so\'m', style: widget.textStyle),
        ),
      );
    }
  }
}

extension NumberFormatting on num {
  String get formattedPrice => toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (m) => '${m[1]} ',
      );
}
