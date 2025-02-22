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

class Invitation0105 extends InvitationTemplate {
  const Invitation0105({
    super.key,
    required super.template,
  });

  @override
  State<Invitation0105> createState() => _Invitation0105State();
}

class _Invitation0105State extends BaseInvitationState<Invitation0105> {
  @override
  Widget buildTopImage() => Center(child: widget.template.topImage);

  @override
  Widget buildCenterWidget() => Column(
        children: [
          CenterWidget(
            husbandName: widget.template.husbandName,
            wifeName: widget.template.wifeName,
            image: widget.template.circleCenterImage!,
            color: AppColors.blueTemplateColor,
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
              color: AppColors.blueTemplateColor,
              fontFamily: 'Coneria',
            ),
          ),
        ),
      );

  @override
  Widget buildDataWidget() => DataBuildWidget(
        color: AppColors.blueTemplateColor,
        dateTime: widget.template.weddingDate,
        eventTime: widget.template.weddingTime,
        isVertical: false,
        fontName: 'Coneria',
      );
  @override
  Widget buildDescription(BuildContext context) => Padding(
        padding: AppUtils.kPaddingAll4,
        child: Text(
          widget.template.description,
          textAlign: TextAlign.center,
          style: context.textTheme.headlineLarge?.copyWith(
            color: AppColors.blueTemplateColor,
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
            color: AppColors.blueTemplateColor,
          ),
          Padding(
            padding: AppUtils.kPaddingAll10,
            child: MapButton(
              addressUrl: widget.template.addressUrl,
              colors: const [Color(0xFF6A5ACD), Color(0xFF5F9EA0)],
            ),
          ),
        ],
      );

  @override
  Widget buildBottomImage() => Center(child: widget.template.bottomImage);

  @override
  Widget buildAdsWidget() => const AdsWidget(
        color: AppColors.blueTemplateColor,
      );
}
