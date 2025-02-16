import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/context_utils.dart';
import '../../../gen/assets.gen.dart';
import '../../../router/app_route.dart';
import '../data/model/yellow_template.dart';
import '../templates/invitation3100.dart';
import 'custom_richtext.dart';

class TemplatesItem extends StatelessWidget {
  const TemplatesItem({super.key});

  @override
  Widget build(BuildContext context) {
    final yellowTemplate = YellowTemplate(
        mainText: 'The Wedding Day',
        husbandName: 'Temur',
        wifeName: 'Sarvinozxon',
        weddingDate: DateTime(2025, 3, 7),
        weddingTime: const TimeOfDay(hour: 19, minute: 0),
        description:
            'Aziz mehmonimiz, Sizni 19:00 da boshlanadigan Visol oqshomimizga taklif etamiz. Siz bilan ushbu baxtli onlarni baham ko‘rish biz uchun sharaf!',
        addressName: 'Toshkent shahar, Yakkasaroy to\'yxonasi',
        addressUrl: 'https://yandex.uz/maps/org/183122456222/?ll=69.260693%2C41.279370&z=17',
        images: [],
        bottomImage: Assets.images.bottomflowersYellow.image(),
        topImage: Assets.images.topflowersYellow.image(),
        circleCenterImage: Assets.images.centerinvetationflower.image(
          fit: BoxFit.fill,
        ),
      );
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: SizedBox(
        width: context.height * .4,
        height: context.height * .87,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.height * .4,
                  height: context.height * .7,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Invitation3100(
                      yellowTemplate: yellowTemplate,
                    ),
                  ),
                ),
                const CustomRichtext(
                  mainText: '#3100',
                  text: ' - Taklifnoma',
                ),
                CustomRichtext(
                  textStyle: context.textTheme.bodySmall?.copyWith(color: AppColors.black),
                  mainText: '#Info: ',
                  text: '''
  Lorem Ipsum is simply dummy text of the printing and typesetting industry.
  Lorem Ipsum is simply dummy text of the printing and typesetting industry.''',
                ),
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomRichtext(
                      textStyle: context.textTheme.bodyLarge?.copyWith(color: AppColors.grey),
                      mainText: 'Narxi:',
                      text: ' 100 000 so\'m',
                    ),
                    IconButton(
                      onPressed: () {
                        context.pushReplacementNamed(Routes.editInvitetation);
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
}
