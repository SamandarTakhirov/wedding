import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_colors.dart';
import '../../../core/utils/context_utils.dart';
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
  Widget build(BuildContext context) => SizedBox(
        height: 780,
        width: 500,
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
                GestureDetector(
                  onTap: () {
                    if (widget.templateInfoModel.price != 0)
                      context.go(
                        '/view_invitation/${widget.templateInfoModel.templateCode.replaceAll("#", "")}/${widget.templateInfoModel.template.template.husbandName}/${widget.templateInfoModel.template.template.wifeName}',
                        extra: widget.templateInfoModel.template,
                      );
                  },
                  child: Container(
                    height: 650,
                    width: 500,
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: widget.templateInfoModel.template,
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
                          context.go(
                            '/invitetation/${widget.templateInfoModel.templateCode.replaceAll("#", "")}/edit',
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
      );
}
