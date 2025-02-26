import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/extension.dart';
import '../../../gen/assets.gen.dart';
import '../data/model/template_info_model.dart';
import '../data/model/template_model.dart';
import '../templates/invitation0105.dart';
import '../templates/invitation1005.dart';
import '../templates/invitation3100.dart';
import '../widgets/templates_item.dart';

class InvitationScreen extends StatefulWidget {
  const InvitationScreen({super.key});

  @override
  State<InvitationScreen> createState() => _InvitationScreenState();
}

class _InvitationScreenState extends State<InvitationScreen> with SingleTickerProviderStateMixin {
  late final TemplateModel yellowTemplate;
  late final TemplateModel greenTemplate;
  late final TemplateModel blueTemplate;
  late final TemplateModel comingSoon;
  late final List<TemplateInfoModel> allTemplates;
  late final List<TemplateInfoModel> weddingTemplates;
  late final List<TemplateInfoModel> birthdayTemplates;
  late final List<TemplateInfoModel> greetingTemplates;
  late final List<TemplateInfoModel> cradleTemplates;
  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
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

    comingSoon = TemplateModel(
      isDesable: true,
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

    weddingTemplates = [
      TemplateInfoModel(
        price: 120000,
        templateCode: '#3100',
        templateInfo: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        template: Invitation3100(template: yellowTemplate),
      ),
      TemplateInfoModel(
        price: 100000,
        templateCode: '#1005',
        templateInfo: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        template: Invitation1005(template: greenTemplate),
      ),
      TemplateInfoModel(
        price: 150000,
        templateCode: '#0105',
        templateInfo: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        template: Invitation0105(template: blueTemplate),
      ),
    ];

    birthdayTemplates = [
      TemplateInfoModel(
        price: 0,
        templateCode: 'Birthday',
        templateInfo: 'Tez orada Birthday uchun shablonlar mavjud bo‘ladi.',
        template: Invitation3100(template: comingSoon),
      )
    ];

    greetingTemplates = [
      TemplateInfoModel(
        price: 0,
        templateCode: 'Tabriknoma',
        templateInfo: 'Tez orada Tabriknoma uchun shablonlar mavjud bo‘ladi.',
        template: Invitation3100(template: comingSoon),
      )
    ];

    cradleTemplates = [
      TemplateInfoModel(
        price: 0,
        templateCode: 'Beshik to\'y',
        templateInfo: 'Tez orada Beshik to‘y uchun shablonlar mavjud bo‘ladi.',
        template: Invitation3100(template: comingSoon),
      )
    ];

    allTemplates = [
      ...weddingTemplates,
      ...birthdayTemplates,
      ...greetingTemplates,
      ...cradleTemplates,
    ];

    _tabController = TabController(length: 5, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.only(left: context.width > 600 ? 250 : 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'Taklifnomalar Katologi',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
              TabBar(
                dividerColor: Colors.transparent,
                isScrollable: true,
                controller: _tabController,
                labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                unselectedLabelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.grey),
                labelColor: AppColors.purple,
                unselectedLabelColor: AppColors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 4,
                indicatorColor: AppColors.purple,
                tabs: const [
                  Tab(text: 'Hammasi'),
                  Tab(text: 'To\'y Taklifnomalari'),
                  Tab(text: 'Tug\'ilgan Kun'),
                  Tab(text: 'Tabriknoma'),
                  Tab(text: 'Beshik to\'y'),
                ],
              ),
              Flexible(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    CustomGridView(
                      scrollController: _scrollController,
                      template: allTemplates,
                    ),
                    CustomGridView(
                      scrollController: _scrollController,
                      template: weddingTemplates,
                    ),
                    CustomGridView(
                      scrollController: _scrollController,
                      template: birthdayTemplates,
                    ),
                    CustomGridView(
                      scrollController: _scrollController,
                      template: greetingTemplates,
                    ),
                    CustomGridView(
                      scrollController: _scrollController,
                      template: cradleTemplates,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    required this.scrollController,
    required this.template,
    super.key,
  });

  final ScrollController scrollController;

  final List<TemplateInfoModel> template;
  @override
  Widget build(BuildContext context) => GridView.builder(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          mainAxisExtent: 780,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.6,
        ),
        itemCount: template.length,
        itemBuilder: (context, index) => TemplatesItem(
          templateInfoModel: template[index],
        ),
      );
}
