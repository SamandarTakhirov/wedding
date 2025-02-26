import '../utils/direction_model.dart';
import '../utils/location_model.dart';
import '../utils/user_type_enum.dart';

abstract interface class UserDataSource {
  /// [userID]
  String get userID;
  Future<void> setUserID(String userID);

  /// [clientTypeId]
  String get clientTypeId;
  Future<void> setClientTypeId(String clientTypeId);

  /// [accessToken]
  String get accessToken;
  Future<void> setAccessToken(String accessToken);

  /// [refreshToken]
  String get refreshToken;
  Future<void> setRefreshToken(String refreshToken);

  /// [firstname]
  String get firstname;
  Future<void> setFirstname(String firstname);

  /// [surname]
  String get surname;
  Future<void> setSurname(String surname);

  /// [image]
  String get image;
  Future<void> setImage(String image);

  /// [phoneNumber]
  String get phoneNumber;
  Future<void> setPhoneNumber(String phoneNumber);

  /// [warehouseId]
  String get warehouseId;
  Future<void> setWarehouseId(String warehouseId);

  /// [roleId]
  String get roleId;
  Future<void> setRoleId(String roleId);

  /// [userGuid]
  String get userGuid;
  Future<void> setUserGuid(String userGuid);

  /// [subdivisionId]
  String get subdivisionId;
  Future<void> setSubdivisionId(String subdivisionId);

  /// [subdivisionName]
  String get subdivisionName;
  Future<void> setSubdivisionName(String subdivisionName);

  /// [userType]
  UserType get userType;
  Future<void> setUserType(String userType);

  /// [clientOrderDeliveryAddress]
  LocationModel? get clientOrderDeliveryAddress;
  Future<void> setClientOrderDeliveryAddress(LocationModel clientOrderDeliveryAddress);

  /// [clientOrderPaymentMethod]
  int get clientOrderPaymentMethod;
  Future<void> setClientOrderPaymentMethod(int clientOrderPaymentMethod);

  /// [cardCode]
  String get clientCardCode;
  Future<void> setClientCardCode(String clientCardCode);

  /// [managerFinanceCurrency]
  String get managerFinanceCurrency;
  Future<void> setManagerFinanceCurrency(String managerFinanceCurrency);

  /// [DirectionLS]
  DirectionLS? get direction;
  Future<void> setDirection(DirectionLS direction);

  bool get isUserAuthenticated;
}
