import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class ImagesCarouselWidget extends StatelessWidget {
  const ImagesCarouselWidget({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const SizedBox.shrink(); 
    }
    return Padding(
      padding: const EdgeInsets.all(8),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(seconds: 2),
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
        ),
        items: images
            .map((imagePath) => ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: _buildImage(imagePath),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    if (kIsWeb) {
      // Web uchun - base64 yoki URL dan yuklash
      if (imagePath.startsWith('http') || imagePath.startsWith('https')) {
        return Image.network(imagePath, fit: BoxFit.cover, width: double.infinity);
      } else {
        // Base64 formatni dekodlash
        var bytes = base64Decode(imagePath);
        return Image.memory(bytes, fit: BoxFit.cover, width: double.infinity);
      }
    } else {
      // Mobil uchun - File dan yuklash
      return Image.file(File(imagePath), fit: BoxFit.cover, width: double.infinity);
    }
  }
}
