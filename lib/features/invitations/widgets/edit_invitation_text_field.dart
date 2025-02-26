import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/utils/context_utils.dart';

class EditInvitationTextField extends StatelessWidget {
  const EditInvitationTextField({
    required this.controller,
    required this.label,
    this.isDescription = false,
    super.key,
  });

  final String label;
  final TextEditingController controller;
  final bool isDescription;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.grey,
              ),
            ),
            TextField(
           
              cursorColor: AppColors.blue,
              autofocus: true,
              textInputAction: TextInputAction.next,
              obscuringCharacter: '•',
              controller: controller,
              textAlign: TextAlign.start,
              maxLines: isDescription ? 5 : 1,
              decoration: InputDecoration(
                contentPadding: isDescription ? const EdgeInsets.symmetric(vertical: 10, horizontal: 10) : null,
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
              ),
            ),
          ],
        ),
      );
}
