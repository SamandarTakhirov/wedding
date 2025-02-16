import 'package:flutter/material.dart';

import '../../../core/utils/context_utils.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget({
    required this.address,
    super.key,
  });

  final String address;

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          'Manzil: ${widget.address}',
          textAlign: TextAlign.center,
          style: context.textTheme.headlineLarge?.copyWith(
            color: const Color(0xFF966737),
            fontFamily: 'GreatVibes',
          ),
        ),
      );
}
