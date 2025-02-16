import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/extension/extension.dart';
import '../../../core/utils/context_utils.dart';
import '../../../core/utils/utils.dart';
import '../data/model/yellow_template.dart';
import '../widgets/address_widget.dart';
import '../widgets/center_widget.dart';
import '../widgets/data_build_widget.dart';
import '../widgets/image_carouel_widget.dart';
import '../widgets/map_widget.dart';

class Invitation3100 extends StatefulWidget {
  const Invitation3100({
    required this.yellowTemplate,
    super.key,
  });

  @override
  State<Invitation3100> createState() => _Invitation3100State();
  final YellowTemplate yellowTemplate;
}

class _Invitation3100State extends State<Invitation3100> {
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
                      Center(child: widget.yellowTemplate.topImage),
                      Padding(
                        padding: AppUtils.kPaddingAll10,
                        child: Animate(
                          effects: const [
                            FadeEffect(
                              duration: Duration(seconds: 1),
                              delay: Duration(seconds: 1),
                            ),
                          ],
                          child: Text(
                            widget.yellowTemplate.mainText,
                            textAlign: TextAlign.center,
                            style: context.textTheme.displayMedium?.copyWith(
                              color: const Color(0xFF966737),
                              fontFamily: 'GreatVibes',
                            ),
                          ),
                        ),
                      ),
                      AppUtils.kGap20,
                      CenterWidget(
                        // constraints: ,
                        husbandName: widget.yellowTemplate.husbandName,
                        wifeName: widget.yellowTemplate.wifeName,
                        child: widget.yellowTemplate.circleCenterImage!,
                      ),
                      AppUtils.kGap20,
                      DataBuildWidget(
                        dateTime: widget.yellowTemplate.weddingDate,
                        eventTime: widget.yellowTemplate.weddingTime,
                      ),
                      AppUtils.kGap20,
                      Padding(
                        padding: AppUtils.kPaddingAll4,
                        child: Text(
                          widget.yellowTemplate.description,
                          textAlign: TextAlign.center,
                          style: context.textTheme.headlineLarge?.copyWith(
                            color: const Color(0xFF966737),
                            fontFamily: 'GreatVibes',
                          ),
                        ),
                      ),
                      if (widget.yellowTemplate.images.isNotNull) ...[
                        ImagesCarouselWidget(
                          images: widget.yellowTemplate.images!,
                        )
                      ],
                      AppUtils.kGap20,
                      AddressWidget(
                        address: widget.yellowTemplate.addressName,
                      ),
                      Padding(
                        padding: AppUtils.kPaddingAll10,
                        child: MapButton(
                          addressUrl: widget.yellowTemplate.addressUrl,
                        ),
                      ),
                      AppUtils.kGap20,
                      Center(child: widget.yellowTemplate.bottomImage),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
