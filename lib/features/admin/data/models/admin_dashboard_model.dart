class AdminDashboardModel {
  const AdminDashboardModel({
    required this.userName,
    required this.address,
    required this.addressUrl,
    required this.phoneNumber,
    required this.isActive,
    required this.lastPayment,
    required this.paymentInvoiceImage,
    required this.userLogin,
    required this.userPassword,
  });

  factory AdminDashboardModel.fromJson(Map<String, Object?> json) => AdminDashboardModel(
        userName: json['userName'] as String,
        address: json['address'] as String,
        addressUrl: json['addressUrl'] as String,
        phoneNumber: json['phoneNumber'] as String,
        isActive: json['isActive'] as bool,
        lastPayment: json['lastPayment'] as DateTime,
        paymentInvoiceImage: json['paymentInvoiceImage'] as String,
        userLogin: json['userLogin'] as String,
        userPassword: json['userPassword'] as String,
      );
  AdminDashboardModel copyWith({
    String? userName,
    String? address,
    String? addressUrl,
    String? phoneNumber,
    bool? isActive,
    DateTime? lastPayment,
    String? paymentInvoiceImage,
    String? userLogin,
    String? userPassword,
  }) =>
      AdminDashboardModel(
        userName: userName ?? this.userName,
        address: address ?? this.address,
        addressUrl: addressUrl ?? this.addressUrl,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        isActive: isActive ?? this.isActive,
        lastPayment: lastPayment ?? this.lastPayment,
        paymentInvoiceImage: paymentInvoiceImage ?? this.paymentInvoiceImage,
        userLogin: userLogin ?? this.userLogin,
        userPassword: userPassword ?? this.userPassword,
      );

  final String userName;
  final String address;
  final String addressUrl;
  final String phoneNumber;
  final bool isActive;
  final DateTime lastPayment;
  final String paymentInvoiceImage;
  final String userLogin;
  final String userPassword;
}
