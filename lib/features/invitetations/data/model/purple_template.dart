class PurpleTemplate {
  const PurpleTemplate({
    required this.husbandName,
    required this.wifeName,
    required this.weddingDate,
    required this.address,
    required this.addressLang,
    required this.addressLat,
  });

  factory PurpleTemplate.fromJson(Map<String, Object?> json) => PurpleTemplate(
        husbandName: json['husbandName'] as String,
        wifeName: json['wifeName'] as String,
        weddingDate: json['weddingDate'] as DateTime,
        address: json['address'] as String,
        addressLang: json['addressLang'] as double,
        addressLat: json['addressLat'] as double,
      );

  final String? husbandName;
  final String? wifeName;
  final DateTime? weddingDate;
  final String? address;
  final double? addressLang;
  final double? addressLat;
}
