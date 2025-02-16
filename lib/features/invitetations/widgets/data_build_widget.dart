import 'dart:async';
import 'package:flutter/material.dart';

import '../../../core/extension/extension.dart';
import '../../../core/utils/context_utils.dart';

class DataBuildWidget extends StatelessWidget {
  const DataBuildWidget({
    required this.dateTime,
    required this.eventTime,
    super.key,
  });

  final DateTime dateTime;
  final TimeOfDay eventTime;

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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DataWidget(text: day),
              Text(
                month,
                style: context.textTheme.headlineLarge?.copyWith(
                  color: const Color(0xFF966737),
                  fontFamily: 'GreatVibes',
                ),
              ),
              DataWidget(text: year),
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
                  color: const Color(0xFF966737),
                  fontFamily: 'GreatVibes',
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
                  timeWidget('$days', 'Kun'),
                  timerDivider(),
                ],
                timeWidget('$hours', 'Soat'),
                timerDivider(),
                timeWidget('$minutes', 'Daqiqa'),
                timerDivider(),
                timeWidget('$seconds', 'Soniya'),
              ],
            );
          },
        ),
      ],
    );
  }
}

Widget timerDivider() => const Text(
      ':',
      style: TextStyle(
        color: Color(0xFF966737),
        fontFamily: 'GreatVibes',
        fontSize: 50,
      ),
    );

Widget timeWidget(String value, String label) => Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF966737),
            fontFamily: 'GreatVibes',
            fontSize: 50,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF966737),
            fontSize: 22,
            fontFamily: 'GreatVibes',
          ),
        ),
      ],
    );

class DataWidget extends StatelessWidget {
  const DataWidget({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 1,
            width: context.width > 500 ? 100 : 85,
            child: const DecoratedBox(
              decoration: BoxDecoration(color: Color(0xFF966737)),
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF966737),
              fontFamily: 'GreatVibes',
              fontSize: 40,
            ),
          ),
          SizedBox(
            height: 1,
            width: context.width > 500 ? 100 : 85,
            child: const DecoratedBox(
              decoration: BoxDecoration(color: Color(0xFF966737)),
            ),
          ),
        ],
      );
}
