import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/context_utils.dart';
import '../../../core/utils/utils.dart';
import '../widgets/address_widget.dart';
import '../widgets/ads_widget.dart';
import '../widgets/center_widget.dart';
import '../widgets/data_build_widget.dart';
import '../widgets/image_carouel_widget.dart';
import '../widgets/map_widget.dart';
import 'invitation_template.dart';

class Invitation1005 extends InvitationTemplate {
  const Invitation1005({
    super.key,
    required super.template,
  });

  @override
  State<Invitation1005> createState() => _Invitation1005State();
}

class _Invitation1005State extends BaseInvitationState<Invitation1005> {
  @override
  Widget buildTopImage() => Center(child: widget.template.topImage);

  @override
  Widget buildCenterWidget() => Column(
        children: [
          AppUtils.kGap20,
          CenterWidget(
            husbandName: widget.template.husbandName,
            wifeName: widget.template.wifeName,
            husbandTextAlign: Alignment.centerRight,
            image: widget.template.circleCenterImage!,
            topSpaceWidget: AppUtils.kGap28,
            color: AppColors.greenTemplateColor,
            padding: 100,
          ),
        ],
      );

  @override
  Widget buildMainText(BuildContext context) => Padding(
        padding: AppUtils.kPaddingAll10,
        child: Animate(
          effects: const [
            FadeEffect(
              duration: Duration(seconds: 1),
              delay: Duration(seconds: 1),
            ),
          ],
          child: Text(
            widget.template.mainText,
            textAlign: TextAlign.center,
            style: context.textTheme.displayMedium?.copyWith(
              color: AppColors.greenTemplateColor,
              fontFamily: 'Coneria',
            ),
          ),
        ),
      );

  @override
  Widget buildDataWidget() => DataBuildWidget(
        dateTime: widget.template.weddingDate,
        eventTime: widget.template.weddingTime,
        isVertical: false,
        fontName: 'Coneria',
        color: AppColors.greenTemplateColor,
      );
  @override
  Widget buildDescription(BuildContext context) => Padding(
        padding: AppUtils.kPaddingAll4,
        child: Text(
          widget.template.description,
          textAlign: TextAlign.center,
          style: context.textTheme.headlineLarge?.copyWith(
            color: AppColors.greenTemplateColor,
            fontFamily: 'GreatVibes',
          ),
        ),
      );

  @override
  Widget buildImagesCarousel() =>
      widget.template.images!.isNotNull ? ImagesCarouselWidget(images: widget.template.images!) : const SizedBox();

  @override
  Widget buildAddressAndMap() => Column(
        children: [
          AppUtils.kGap20,
          AddressWidget(
            address: widget.template.addressName,
            fontName: 'LucySaid',
            color: AppColors.greenTemplateColor,
          ),
          Padding(
            padding: AppUtils.kPaddingAll10,
            child: MapButton(
              addressUrl: widget.template.addressUrl,
              colors: const [Color(0xFF808000), Color(0xFF9ACD32)],
            ),
          ),
        ],
      );

  @override
  Widget buildBottomImage() => Center(child: widget.template.bottomImage);

  @override
  Widget buildAdsWidget() => const AdsWidget();
}
