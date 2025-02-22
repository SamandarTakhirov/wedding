import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/app_colors.dart';
import '../../../core/utils/context_utils.dart';
import '../../../core/utils/utils.dart';
import '../../../gen/assets.gen.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({
     this.color = AppColors.yellowTemplateColor,
    super.key,
  });

  final Color color;

  Future<void> _openTelegram() async {
    final url = Uri.parse('https://t.me/taklifnomavip');

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _openInstagram() async {
    final url = Uri.parse('https://www.instagram.com/taklifnomavip/');

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          children: [
            Text(
              'Sayt taklifnomaga buyurtma berish:',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineMedium?.copyWith(
                color:color,
                fontFamily: 'Dancing',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    BuildTextButton(
                      color: color,
                      onTap: _openInstagram,
                      svg: Assets.svg.instagram,
                      text: 'Instagram',
                    ),
                  ],
                ),
                Row(
                  children: [
                    BuildTextButton(
                      color: color,
                      onTap: _openTelegram,
                      svg: Assets.svg.telegram,
                      text: 'Telegram',
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
}

class BuildTextButton extends StatelessWidget {
  const BuildTextButton({
    required this.svg,
    required this.text,
    required this.onTap,
    required this.color,
    super.key,
  });

  final String text;
  final SvgGenImage svg;
  final void Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          overlayColor: AppColors.grey,
        ),
        child: Row(
          children: [
            svg.svg(
              width: 24,
              height: 24,
              color:color,
            ),
            AppUtils.kGap4,
            Text(
              text,
              style: context.textTheme.headlineMedium?.copyWith(
                color:color,
                fontFamily: 'Dancing',
              ),
            ),
          ],
        ),
      );
}
