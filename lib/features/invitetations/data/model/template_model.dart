import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class TemplateModel extends Equatable {
  const TemplateModel({
    required this.mainText,
    required this.husbandName,
    required this.wifeName,
    required this.weddingDate,
    required this.weddingTime,
    required this.description,
    required this.addressName,
    required this.addressUrl,
    this.images,
    this.circleCenterImage,
    this.bottomImage,
    this.topImage,
    this.isDesable,
  });

  factory TemplateModel.fromJson(Map<String, Object?> json) => TemplateModel(
        mainText: json['mainText'] as String,
        husbandName: json['husbandName'] as String,
        wifeName: json['wifeName'] as String,
        weddingDate: DateTime.parse(json['weddingDate'] as String),
        weddingTime: TimeOfDay(
          hour: int.parse(json['weddingHour'].toString()),
          minute: int.parse(json['weddingMinute'].toString()),
        ),
        description: json['description'] as String,
        addressName: json['addressName'] as String,
        addressUrl: json['addressUrl'] as String,
        isDesable: json['isDesable'] as bool,
        images: List<String>.from(json['images'] as List),
        circleCenterImage: json['circleCenterImage'] as AssetGenImage,
        bottomImage: json['bottomImage'] != null ? Image.network(json['bottomImage'] as String) : null,
        topImage: json['topImage'] != null ? Image.network(json['topImage'] as String) : null,
      );

  final String mainText;
  final String husbandName;
  final String wifeName;
  final DateTime weddingDate;
  final TimeOfDay weddingTime;
  final String description;
  final String addressName;
  final String addressUrl;
  final List<String>? images;
  final AssetGenImage? circleCenterImage;
  final Widget? bottomImage;
  final Widget? topImage;
  final bool? isDesable;

  TemplateModel copyWith({
    String? mainText,
    String? husbandName,
    String? wifeName,
    DateTime? weddingDate,
    TimeOfDay? weddingTime,
    String? description,
    String? addressName,
    String? addressUrl,
    List<String>? images,
    AssetGenImage? circleCenterImage,
    Widget? bottomImage,
    Widget? topImage,
    bool? isDesable,
  }) =>
      TemplateModel(
        mainText: mainText ?? this.mainText,
        husbandName: husbandName ?? this.husbandName,
        wifeName: wifeName ?? this.wifeName,
        weddingDate: weddingDate ?? this.weddingDate,
        weddingTime: weddingTime ?? this.weddingTime,
        description: description ?? this.description,
        addressName: addressName ?? this.addressName,
        addressUrl: addressUrl ?? this.addressUrl,
        images: images ?? this.images,
        circleCenterImage: circleCenterImage ?? this.circleCenterImage,
        bottomImage: bottomImage ?? this.bottomImage,
        topImage: topImage ?? this.topImage,
        isDesable: isDesable ?? this.isDesable,
      );

  @override
  List<Object?> get props => [
        mainText,
        husbandName,
        wifeName,
        weddingDate,
        weddingTime,
        description,
        addressName,
        addressUrl,
        images,
        circleCenterImage,
        bottomImage,
        topImage,
        isDesable,
      ];
}
