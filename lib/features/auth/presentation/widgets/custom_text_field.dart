import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../core/utils/context_utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.showPassword = false,
    this.errorText,
    this.showPasswordFunction,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final bool isPassword;
  final String? errorText;
  final bool showPassword;
  final void Function()? showPasswordFunction;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        cursorColor: AppColors.blue,
        autofocus: true,
        textInputAction: TextInputAction.next,
        obscureText: isPassword && !showPassword,
        obscuringCharacter: '•',
        decoration: InputDecoration(
          hintText: isPassword ? 'Password' : 'Login',
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
                    showPassword ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.grey,
                  ),
                  onPressed: showPasswordFunction,
                )
              : null,
        ),
      );
}
