import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/extension.dart';
import '../templates/invitation_template.dart';

class ViewInvitationScreen extends StatefulWidget {
  const ViewInvitationScreen({
    super.key,
    required this.templateId,
    required this.userGuid,
    required this.shifrcode,
    required this.template,
  });
  final String templateId;
  final String userGuid;
  final String shifrcode;
  final InvitationTemplate template;

  @override
  State<ViewInvitationScreen> createState() => _ViewInvitationScreenState();
}

class _ViewInvitationScreenState extends State<ViewInvitationScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: SizedBox(
            width: context.height * .5,
            height: context.height,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 500,
                child: widget.template,
              ),
            ),
          ),
        ),
      );
}
