import 'dart:async';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/context_utils.dart';

class DataBuildWidget extends StatelessWidget {
  const DataBuildWidget({
    required this.dateTime,
    required this.eventTime,
    this.fontName = 'GreatVibes',
    this.isVertical = true,
    this.color = AppColors.yellowTemplateColor,
    super.key,
  });

  final DateTime dateTime;
  final TimeOfDay eventTime;
  final String? fontName;
  final bool isVertical;
  final Color? color;

  Stream<Duration> countdownStream() async* {
    while (true) {
      var now = DateTime.now();
      var eventDateTime = DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        eventTime.hour,
        eventTime.minute,
      );
      var difference = eventDateTime.difference(now);
      if (difference.isNegative) break;
      yield difference;
      await Future<void>.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    final months = <String>[
      'Yanvar',
      'Fevral',
      'Mart',
      'Aprel',
      'May',
      'Iyun',
      'Iyul',
      'Avgust',
      'Sentabr',
      'Oktabr',
      'Noyabr',
      'Dekabr'
    ];

    final day = dateTime.day.toString().padLeft(2, '0');
    final month = months[dateTime.month - 1];
    final year = dateTime.year.toString();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DataWidget(
                color: color!,
                text: isVertical ? day : month,
                fontName: fontName!,
                isVertical: isVertical,
              ),
              Row(
                spacing: 20,
                children: [
                  if (!isVertical)
                    SizedBox(
                      height: 60,
                      width: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: color),
                      ),
                    ),
                  Text(
                    isVertical ? month : day,
                    style: isVertical
                        ? context.textTheme.displayMedium?.copyWith(
                            color: color,
                            fontFamily: fontName,
                          )
                        : context.textTheme.displayLarge?.copyWith(
                            color: color,
                            fontFamily: fontName,
                          ),
                  ),
                  if (!isVertical)
                    SizedBox(
                      height: 60,
                      width: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: color),
                      ),
                    ),
                ],
              ),
              DataWidget(
                color: color!,
                text: year,
                fontName: fontName!,
                isVertical: isVertical,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        StreamBuilder<Duration>(
          stream: countdownStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text(
                'Tadbir allaqachon boshlangan!',
                style: context.textTheme.headlineMedium?.copyWith(
                  color: color,
                  fontFamily: fontName,
                ),
              );
            }

            final timeLeft = snapshot.data!;
            final days = timeLeft.inDays;
            final hours = timeLeft.inHours % 24;
            final minutes = timeLeft.inMinutes % 60;
            final seconds = timeLeft.inSeconds % 60;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (days > 0) ...[
                  timeWidget('$days', 'Kun', fontName!, color!),
                  timerDivider(fontName!, color!),
                ],
                timeWidget('$hours', 'Soat', fontName!, color!),
                timerDivider(fontName!, color!),
                timeWidget('$minutes', 'Daqiqa', fontName!, color!),
                timerDivider(fontName!, color!),
                timeWidget('$seconds', 'Soniya', fontName!, color!),
              ],
            );
          },
        ),
      ],
    );
  }
}

Widget timerDivider(String fontName, Color color) => Text(
      ':',
      style: TextStyle(
        color: color,
        fontFamily: fontName,
        fontSize: 50,
      ),
    );

Widget timeWidget(String value, String label, String fontName, Color color) => Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontFamily: fontName,
            fontSize: 50,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 22,
            fontFamily: fontName,
          ),
        ),
      ],
    );

class DataWidget extends StatelessWidget {
  const DataWidget({
    required this.text,
    required this.fontName,
    this.isVertical = true,
    required this.color,
    super.key,
  });
  final String text;
  final String fontName;
  final bool isVertical;
  final Color color;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isVertical)
            SizedBox(
              height: 1,
              width: context.width > 500 ? 100 : 85,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            ),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontFamily: fontName,
              fontSize: 40,
            ),
          ),
          if (isVertical)
            SizedBox(
              height: 1,
              width: context.width > 500 ? 100 : 85,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            ),
        ],
      );
}
