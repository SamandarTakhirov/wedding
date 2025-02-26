import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../core/utils/context_utils.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.controller,
    required this.hintText,
    this.errorText,
    this.isPassword = false,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final String? errorText;

  final ValueNotifier<bool> _obscureText = ValueNotifier(true);

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
        valueListenable: _obscureText,
        builder: (context, obscure, child) => TextFormField(
          controller: controller,
          cursorColor: AppColors.blue,
          autofocus: true,
          textInputAction: TextInputAction.next,
          obscureText: isPassword ? obscure : false,
          obscuringCharacter: '•',
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: context.textTheme.labelLarge?.copyWith(
              color: AppColors.grey,
            ),
            errorText: errorText?.isNotEmpty == true ? errorText : null,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.red,
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.blue,
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.grey,
                    ),
                    onPressed: () {
                      _obscureText.value = !_obscureText.value;
                    },
                  )
                : null,
          ),
        ),
      );
}
