import '../../../invitations/templates/invitation_template.dart';

class DashboardTemplateModel {
  const DashboardTemplateModel({
    required this.customPrice,
    required this.profit,
    required this.templateCode,
    required this.templateScreenUrl,
    required this.taklifnomaVipPrice,
    required this.template,
  });

  factory DashboardTemplateModel.fromJson(Map<String, Object?> json) => DashboardTemplateModel(
        customPrice: json['customPrice'] as double,
        profit: json['profit'] as double,
        templateCode: json['templateCode'] as String,
        templateScreenUrl: json['templateScreenUrl'] as String,
        taklifnomaVipPrice: json['taklifnomaVipPrice'] as double,
        template: json['template'] as InvitationTemplate,
      );
  DashboardTemplateModel copyWith({
    String? templateCode,
    String? templateScreenUrl,
    double? taklifnomaVipPrice,
    double? customPrice,
    double? profit,
    InvitationTemplate? template,
  }) =>
      DashboardTemplateModel(
        customPrice: customPrice ?? this.customPrice,
        profit: profit ?? this.profit,
        templateCode: templateCode ?? this.templateCode,
        templateScreenUrl: templateScreenUrl ?? this.templateScreenUrl,
        taklifnomaVipPrice: taklifnomaVipPrice ?? this.taklifnomaVipPrice,
        template: template ?? this.template,
      );

  final String templateCode;
  final String templateScreenUrl;
  final double taklifnomaVipPrice;
  final double customPrice;
  final double profit;
  final InvitationTemplate template;
}
