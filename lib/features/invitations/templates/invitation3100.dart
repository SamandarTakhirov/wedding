import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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

class Invitation3100 extends InvitationTemplate {
  const Invitation3100({
    super.key,
    required super.template,
  });
  @override
  State<Invitation3100> createState() => _Invitation3100State();
}

class _Invitation3100State extends BaseInvitationState<Invitation3100> {
  @override
  Widget buildTopImage() => Center(child: widget.template.topImage);

  @override
  Widget buildCenterWidget() => Column(
        children: [
          AppUtils.kGap20,
          CenterWidget(
            husbandName: widget.template.husbandName,
            wifeName: widget.template.wifeName,
            image: widget.template.circleCenterImage!,
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
              color: const Color(0xFF966737),
              fontFamily: 'GreatVibes',
            ),
          ),
        ),
      );

  @override
  Widget buildDataWidget() => DataBuildWidget(
        dateTime: widget.template.weddingDate,
        eventTime: widget.template.weddingTime,
      );
  @override
  Widget buildDescription(BuildContext context) => Padding(
        padding: AppUtils.kPaddingAll4,
        child: Text(
          widget.template.description,
          textAlign: TextAlign.center,
          style: context.textTheme.headlineLarge?.copyWith(
            color: const Color(0xFF966737),
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
          AddressWidget(address: widget.template.addressName),
          Padding(
            padding: AppUtils.kPaddingAll10,
            child: MapButton(addressUrl: widget.template.addressUrl),
          ),
        ],
      );

  @override
  Widget buildBottomImage() => Center(child: widget.template.bottomImage);
  @override
  Widget buildAdsWidget() => const AdsWidget();
}
