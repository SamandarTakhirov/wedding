import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_colors.dart';
import '../../../core/utils/context_utils.dart';
import '../../../router/app_route.dart';
import '../data/model/template_info_model.dart';
import 'custom_richtext.dart';

class TemplatesItem extends StatefulWidget {
  const TemplatesItem({
    required this.templateInfoModel,
    super.key,
  });

  final TemplateInfoModel templateInfoModel;

  @override
  State<TemplatesItem> createState() => _TemplatesItemState();
}

class _TemplatesItemState extends State<TemplatesItem> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 24),
        child: SizedBox(
          width: 500,
          height: 1200,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 100,
                  offset: Offset(40, 20),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 500,
                    height: 650,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Flexible(child: widget.templateInfoModel.template),
                    ),
                  ),
                  CustomRichtext(
                    mainText: widget.templateInfoModel.templateCode,
                    text: ' - Taklifnoma',
                  ),
                  CustomRichtext(
                    textStyle: context.textTheme.bodySmall?.copyWith(color: AppColors.black),
                    mainText: '#Info: ',
                    text: widget.templateInfoModel.templateInfo,
                  ),
                  if (widget.templateInfoModel.price != 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRichtext(
                          textStyle: context.textTheme.bodyLarge?.copyWith(color: AppColors.grey),
                          mainText: 'Narxi:',
                          text: ' ${widget.templateInfoModel.price} so\'m',
                        ),
                        IconButton(
                          onPressed: () {
                            context.pushReplacementNamed(
                              Routes.editInvitetation,
                              extra: widget.templateInfoModel,
                            );
                          },
                          icon: const Icon(
                            CupertinoIcons.forward,
                            color: AppColors.grey,
                          ),
                        )
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      );
}
