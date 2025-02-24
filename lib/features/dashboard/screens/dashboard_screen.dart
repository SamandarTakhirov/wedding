import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/context_utils.dart';
import '../../../core/utils/utils.dart';
import '../../../gen/assets.gen.dart';
import '../../invitetations/data/model/template_model.dart';
import '../../invitetations/templates/invitation0105.dart';
import '../../invitetations/templates/invitation1005.dart';
import '../../invitetations/templates/invitation3100.dart';
import '../data/model/dashboard_template_model.dart';
import '../widgets/dashboard_table_widget.dart';
import '../widgets/info_items.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final List<DashboardTemplateModel> dashboardTemplateModel;
  late final TemplateModel yellowTemplate;
  late final TemplateModel greenTemplate;
  late final TemplateModel blueTemplate;

  @override
  void initState() {
    yellowTemplate = TemplateModel(
      mainText: 'Nikoh to\'yi',
      husbandName: 'Kamoliddin',
      wifeName: 'Nozimaxon',
      weddingDate: DateTime(2025, 5, 20),
      weddingTime: const TimeOfDay(hour: 17, minute: 0),
      description:
          'Aziz mehmonimiz, Sizni 17:00 da boshlanadigan Visol oqshomimizga taklif etamiz. Siz bilan ushbu baxtli onlarni baham ko‘rish biz uchun sharaf!',
      addressName: 'Toshkent shahar, Shayxontoxur tumani, Versal to\'yxonasi.',
      addressUrl: 'https://yandex.uz/maps/-/CHuaj83T',
      images: const [],
      bottomImage: Assets.images.bottomflowersYellow.image(),
      topImage: Assets.images.topflowersYellow.image(),
      circleCenterImage: Assets.images.centerinvetationflower,
    );

    greenTemplate = TemplateModel(
      mainText: 'The Wedding Day',
      husbandName: 'Temur',
      wifeName: 'Sarvinozxon',
      weddingDate: DateTime(2025, 3, 7),
      weddingTime: const TimeOfDay(hour: 19, minute: 0),
      description:
          'Aziz mehmonimiz, Sizni 19:00 da boshlanadigan Visol oqshomimizga taklif etamiz. Siz bilan ushbu baxtli onlarni baham ko‘rish biz uchun sharaf!',
      addressName: 'Toshkent shahar, Yakkasaroy to\'yxonasi.',
      addressUrl: 'https://yandex.uz/maps/-/CHuajPK5',
      images: const [],
      bottomImage: Assets.images.greenbottomimage.image(),
      topImage: Assets.images.greentopimage.image(),
      circleCenterImage: Assets.images.greenflowercenter,
    );

    blueTemplate = TemplateModel(
      mainText: 'Visol oqshomi',
      husbandName: 'Murodjon',
      wifeName: 'Robiyaxon',
      weddingDate: DateTime(2025, 3, 21),
      weddingTime: const TimeOfDay(hour: 20, minute: 0),
      description:
          'Aziz mehmonimiz, Sizni 20:00 da boshlanadigan Visol oqshomimizga taklif etamiz. Siz bilan ushbu baxtli onlarni baham ko‘rish biz uchun sharaf!',
      addressName: 'Toshkent shahar, Samarqand darvoza, Mumtoz to\'yxonasi.',
      addressUrl: 'https://yandex.uz/maps/-/CHueqX6h',
      images: const [],
      bottomImage: Assets.images.bluebottomimage.image(),
      topImage: Assets.images.bluetopimage.image(),
      circleCenterImage: Assets.images.bluecenterimage,
    );
    dashboardTemplateModel = [
      DashboardTemplateModel(
        customPrice: 100000,
        profit: 20000,
        templateCode: '0105',
        templateScreenUrl: 'Link',
        taklifnomaVipPrice: 80000,
        template: Invitation3100(template: yellowTemplate),
      ),
      DashboardTemplateModel(
        customPrice: 100000,
        profit: 50000,
        templateCode: '3100',
        templateScreenUrl: 'Link',
        taklifnomaVipPrice: 50000,
        template: Invitation1005(template: greenTemplate),
      ),
      DashboardTemplateModel(
        customPrice: 100000,
        profit: 30000,
        templateCode: '0105',
        templateScreenUrl: 'Link',
        taklifnomaVipPrice: 70000,
        template: Invitation0105(template: blueTemplate),
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Row(
          children: [
            SizedBox(
              width: context.width > 600 ? 250 : 80,
            ),
            const SizedBox(width: 20),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      'Salom, Samandar Takhirov',
                      style: context.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.width,
                    child: GridView.builder(
                      padding: AppUtils.kPaddingHor24,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 500,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 4,
                      ),
                      itemCount: 3,
                      itemBuilder: (context, index) => InfoItems(
                        svg: Assets.svg.user.svg(
                          color: Colors.green,
                        ),
                        infoText: 'Oylik sof daromat',
                        totalPrice: '1 000 000',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.width,
                    height: context.height,
                    child: DashboardTableWidget(
                      dashboardTemplateModel: dashboardTemplateModel,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
