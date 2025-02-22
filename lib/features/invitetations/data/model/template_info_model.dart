import '../../templates/invitation_template.dart';

class TemplateInfoModel {
  const TemplateInfoModel({
    required this.price,
    required this.templateCode,
    required this.templateInfo,
    required this.template,
  });

  factory TemplateInfoModel.fromJson(Map<String, Object?> json) => TemplateInfoModel(
        price: json['price'] as double,
        templateCode: json['templateCode'] as String,
        templateInfo: json['templateInfo'] as String,
        template: json['template'] as InvitationTemplate,
      );
  final String templateCode;
  final String templateInfo;
  final double price;
  final InvitationTemplate template;

  TemplateInfoModel copyWith({
    String? templateCode,
    String? templateInfo,
    double? price,
    InvitationTemplate? template,
  }) =>
      TemplateInfoModel(
        price: price ?? this.price,
        templateCode: templateCode ?? this.templateCode,
        templateInfo: templateInfo ?? this.templateInfo,
        template: template ?? this.template,
      );
}
