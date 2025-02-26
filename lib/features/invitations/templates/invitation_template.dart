import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/utils/utils.dart';
import '../data/model/template_model.dart';

abstract class InvitationTemplate extends StatefulWidget {
  const InvitationTemplate({
    super.key,
    required this.template,
  });
  final TemplateModel template;
}

abstract class BaseInvitationState<T extends InvitationTemplate> extends State<T> {
  Widget buildTopImage() => const SizedBox.shrink();

  Widget buildMainText(BuildContext context);

  Widget buildCenterWidget();

  Widget buildDataWidget();

  Widget buildDescription(BuildContext context);

  Widget buildBottomImage() => const SizedBox.shrink();

  Widget buildImagesCarousel();
  Widget buildAddressAndMap();

  Widget buildAdsWidget();

  @override
  Widget build(BuildContext context) {
    if (widget.template.isDesable != null && widget.template.isDesable!) {
      return Stack(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Coming Soon\n Tez kunda bu yerda yangi taklifnomalar bo\'ladi',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[500],
              ),
            ),
          ),
        ],
      );
    }
    return SafeArea(
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
}
