import 'package:shared_preferences/shared_preferences.dart';

import 'interface/user_data_source.dart';
import 'preference_dao/preference_entry.dart';
import 'utils/direction_model.dart';
import 'utils/location_model.dart';
import 'utils/secure_store.dart';
import 'utils/user_type_enum.dart';

final class LocalSource extends PreferenceDao implements UserDataSource {
  LocalSource._({required super.sharedPreferences});

  static Future<LocalSource> get instance async {
    final shp = await SharedPreferences.getInstance();
    return LocalSource._(sharedPreferences: shp);
  }

  /// Entries
  PreferenceEntry<String> get _userIdKey => stringEntry(key: 'user.id');
  PreferenceEntry<String> get _userGuidKey => stringEntry(key: 'user.guid');
  PreferenceEntry<String> get _clientTypeIdKey => stringEntry(key: 'user.client_type_id');
  PreferenceEntry<String> get _roleIdKey => stringEntry(key: 'user.role_id');
  PreferenceEntry<String> get _accessTokenKey => stringEntry(key: 'user.access_token');
  PreferenceEntry<String> get _refreshTokenKey => stringEntry(key: 'user.refresh_key');
  PreferenceEntry<String> get _phoneNumberKey => stringEntry(key: 'user.phone_number');
  PreferenceEntry<String> get _firstnameKey => stringEntry(key: 'user.firstname');
  PreferenceEntry<String> get _surnameKey => stringEntry(key: 'user.surname');
  PreferenceEntry<String> get _warehouseId => stringEntry(key: 'user.warehouse_id');
  PreferenceEntry<String> get _imageKey => stringEntry(key: 'user.image');
  PreferenceEntry<String> get _localizationKey => stringEntry(key: 'settings.localization');
  PreferenceEntry<String> get _themeKey => stringEntry(key: 'settings.theme');
  PreferenceEntry<String> get _subdivisionIdKey => stringEntry(key: 'user.subdivision_id');
  PreferenceEntry<String> get _subdivisionNameKey => stringEntry(key: 'user.subdivision_name');
  PreferenceEntry<String> get _userTypeKey => stringEntry(key: 'user.user_type');
  PreferenceEntry<String> get _clientCardCodeKey => stringEntry(key: 'user.client_card_code');
  PreferenceEntry<String> get _clientOrderDeliveryAddressKey => stringEntry(key: 'user.client_order_delivery_address');
  PreferenceEntry<int> get _clientOrderPaymentMethodKey => intEntry(key: 'user.client_order_payment_method');
  PreferenceEntry<String> get _managerFinanceCurrencyKey => stringEntry(key: 'user.manager_finance_currency');
  PreferenceEntry<String> get _directionKey => stringEntry(key: 'user.direction');

  /// *** GETTERS ***

  @override
  String get phoneNumber => _phoneNumberKey.read() ?? '';

  @override
  String get userID => _phoneNumberKey.read() ?? '';

  @override
  String get subdivisionName => _subdivisionNameKey.read() ?? '';

  @override
  String get image => _imageKey.read() ?? '';

  @override
  String get firstname => _firstnameKey.read() ?? '';

  @override
  String get surname => _surnameKey.read() ?? '';

  @override
  String get clientTypeId => _clientTypeIdKey.read() ?? '';

  @override
  String get warehouseId => _warehouseId.read() ?? '';

  @override
  String get roleId => _roleIdKey.read() ?? '';

  @override
  String get userGuid => _userGuidKey.read() ?? '';

  @override
  String get subdivisionId => _subdivisionIdKey.read() ?? '';

  @override
  UserType get userType {
    final userType = _userTypeKey.read() ?? '';

    if (UserType.manager.name.toLowerCase() == userType) {
      return UserType.manager;
    } else if (UserType.client.name.toLowerCase() == userType) {
      return UserType.client;
    }

    return UserType.undefined;
  }

  @override
  LocationModel? get clientOrderDeliveryAddress {
    final location = _clientOrderDeliveryAddressKey.read();
    if (location == null) return null;

    final [locationName, latitude, longitude] = location.split('#');

    return LocationModel(
      locationName: locationName,
      latitude: double.tryParse(latitude) ?? 0,
      longitude: double.tryParse(longitude) ?? 0,
    );
  }

  @override
  int get clientOrderPaymentMethod => _clientOrderPaymentMethodKey.read() ?? 0;

  /// Encrypted values using [SecureStore]
  @override
  String get accessToken => SecureStore.readUsingDecryption(_accessTokenKey);

  @override
  String get refreshToken => SecureStore.readUsingDecryption(_refreshTokenKey);

  @override
  String get clientCardCode => _clientCardCodeKey.read() ?? '';

  @override
  String get managerFinanceCurrency => _managerFinanceCurrencyKey.read() ?? '';

  @override
  DirectionLS? get direction => DirectionLS.fromString(_directionKey.read());

  /// *** SETTERS ***
  @override
  Future<void> setPhoneNumber(String phoneNumber) async => _phoneNumberKey.set(phoneNumber);

  @override
  Future<void> setUserID(String userID) async => await SecureStore.setUsingEncryption(userID, entry: _userIdKey);

  @override
  Future<void> setSubdivisionName(String subdivisionName) async => _subdivisionNameKey.set(subdivisionName);

  @override
  Future<void> setImage(String image) async => await _imageKey.set(image);

  @override
  Future<void> setFirstname(String firstname) async => await _firstnameKey.set(firstname);

  @override
  Future<void> setSurname(String surname) async => await _surnameKey.set(surname);

  @override
  Future<void> setRoleId(String roleId) async => await _roleIdKey.set(roleId);

  @override
  Future<void> setClientTypeId(String clientTypeId) async => await _clientTypeIdKey.set(clientTypeId);

  @override
  Future<void> setWarehouseId(String warehouseId) async => await _warehouseId.set(warehouseId);

  @override
  Future<void> setUserGuid(String userGuid) async => await _userGuidKey.set(userGuid);

  @override
  Future<void> setSubdivisionId(String subdivisionId) async => await _subdivisionIdKey.set(subdivisionId);

  @override
  Future<void> setClientCardCode(String clientCardCode) async => await _clientCardCodeKey.set(clientCardCode);

  @override
  Future<void> setManagerFinanceCurrency(String managerFinanceCurrency) async =>
      await _managerFinanceCurrencyKey.set(managerFinanceCurrency);

  @override
  Future<void> setDirection(DirectionLS direction) async {
    await _directionKey.set(direction.toString());
  }

  @override
  Future<void> setUserType(String clientTypeId) async {
    if (clientTypeId == '2902ed24-b6b6-455e-b786-d0e02e27b5c5') {
      await _userTypeKey.set(UserType.client.name.toLowerCase());
    } else {
      await _userTypeKey.set(UserType.manager.name.toLowerCase());
    }
  }

  @override
  Future<void> setClientOrderDeliveryAddress(LocationModel clientOrderDeliveryAddress) async =>
      await _clientOrderDeliveryAddressKey.set(clientOrderDeliveryAddress.toString());

  @override
  Future<void> setClientOrderPaymentMethod(int clientOrderPaymentMethod) async =>
      await _clientOrderPaymentMethodKey.set(clientOrderPaymentMethod);

  /// Encrypted values using [SecureStore]
  @override
  Future<void> setAccessToken(String accessToken) async =>
      await SecureStore.setUsingEncryption(accessToken, entry: _accessTokenKey);

  @override
  Future<void> setRefreshToken(String refreshToken) async =>
      await SecureStore.setUsingEncryption(refreshToken, entry: _refreshTokenKey);

  /// *** CLEANERS ***
  Future<void> clearAllUserData() async => await Future.wait([
        _userIdKey.remove(),
        _accessTokenKey.remove(),
        _refreshTokenKey.remove(),
        _surnameKey.remove(),
        _firstnameKey.remove(),
        _imageKey.remove(),
        _phoneNumberKey.remove(),
        _warehouseId.remove(),
        _roleIdKey.remove(),
        _clientTypeIdKey.remove(),
        _userGuidKey.remove(),
        _subdivisionIdKey.remove(),
        _subdivisionNameKey.remove(),
        _userTypeKey.remove(),
        _clientCardCodeKey.remove(),
        _clientOrderDeliveryAddressKey.remove(),
        _clientOrderPaymentMethodKey.remove(),
        _managerFinanceCurrencyKey.remove(),
      ]);

  Future<void> clearSettings() async => await Future.wait([
        _themeKey.remove(),
        _localizationKey.remove(),
      ]);

  Future<void> clearAllData() async => await Future.wait([
        clearAllUserData(),
        clearSettings(),
      ]);

  Future<void> clearAllSettings() async => await Future.wait([
        _themeKey.remove(),
        _localizationKey.remove(),
      ]);

  /// *** HELPERS ***
  @override
  bool get isUserAuthenticated => accessToken.isNotEmpty && refreshToken.isNotEmpty;
}

/// Default locale
