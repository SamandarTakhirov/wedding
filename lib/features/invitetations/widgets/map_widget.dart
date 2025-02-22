import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/context_utils.dart';

class MapButton extends StatelessWidget {
  const MapButton({
    required this.addressUrl,
    this.colors = const [
      Color(0xFFD4A373),
      Color(0xFF966737),
    ],
    super.key,
  });

  final String addressUrl;
  final List<Color> colors;

  Future<void> _openMap() async {
    final url = Uri.parse(addressUrl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) => Center(
        child: GestureDetector(
          onTap: _openMap,
          child: PhysicalModel(
            color: Colors.transparent,
            elevation: 6,
            shadowColor: Colors.black26,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              constraints: const BoxConstraints(minWidth: 160, maxHeight: 50),
              alignment: Alignment.center,
              child: Text(
                'Manzilni ko\'rish',
                style: context.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontFamily: 'Weather',
                ),
              ),
            ),
          ),
        ),
      );
}
