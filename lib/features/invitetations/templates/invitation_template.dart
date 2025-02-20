import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';
import '../data/model/template_model.dart';
import '../widgets/ads_widget.dart';

abstract class BaseInvitation extends StatefulWidget {
  const BaseInvitation({
    super.key,
    required this.template,
  });
  final TemplateModel template;
}

abstract class BaseInvitationState<T extends BaseInvitation> extends State<T> {
  Widget buildTopImage() => const SizedBox.shrink();

  Widget buildMainText(BuildContext context);

  Widget buildCenterWidget();

  Widget buildDataWidget();

  Widget buildDescription(BuildContext context);

  Widget buildBottomImage() => const SizedBox.shrink();

  Widget buildImagesCarousel();
  Widget buildAddressAndMap();

  Widget buildAdsWidget() => const AdsWidget();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      buildTopImage(),
                      buildMainText(context),
                      AppUtils.kGap20,
                      buildCenterWidget(),
                      AppUtils.kGap20,
                      buildDataWidget(),
                      AppUtils.kGap20,
                      buildDescription(context),
                      buildImagesCarousel(),
                      buildAddressAndMap(),
                      AppUtils.kGap20,
                      buildAdsWidget(),
                      buildBottomImage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
