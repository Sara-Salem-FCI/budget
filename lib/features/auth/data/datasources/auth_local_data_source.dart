import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
  Future<void> saveUserId(int id);
  Future<int?> getUserId();
  Future<void> saveBaseUrl(String url);
  Future<String?> getBaseUrl();
  Future<void> saveUserData(String userDataJson);
  Future<String?> getUserData();
  Future<void> saveOnboardingVisited(bool visited);
  Future<bool> isOnboardingVisited();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage _storage;
  static const _tokenKey = 'auth_token';
  static const _userIdKey = 'user_id';
  static const _baseUrlKey = 'base_url';
  static const _userDataKey = 'user_data';
  static const _onboardingKey = 'onboarding_visited';

  AuthLocalDataSourceImpl(this._storage);

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _userIdKey);
    await _storage.delete(key: _baseUrlKey);
    await _storage.delete(key: _userDataKey);
  }

  @override
  Future<void> saveUserId(int id) async {
    await _storage.write(key: _userIdKey, value: id.toString());
  }

  @override
  Future<int?> getUserId() async {
    final id = await _storage.read(key: _userIdKey);
    return id != null ? int.tryParse(id) : null;
  }

  @override
  Future<void> saveBaseUrl(String url) async {
    await _storage.write(key: _baseUrlKey, value: url);
  }

  @override
  Future<String?> getBaseUrl() async {
    return await _storage.read(key: _baseUrlKey);
  }

  @override
  Future<void> saveUserData(String userDataJson) async {
    await _storage.write(key: _userDataKey, value: userDataJson);
  }

  @override
  Future<String?> getUserData() async {
    return await _storage.read(key: _userDataKey);
  }

  @override
  Future<void> saveOnboardingVisited(bool visited) async {
    await _storage.write(key: _onboardingKey, value: visited.toString());
  }

  @override
  Future<bool> isOnboardingVisited() async {
    final visited = await _storage.read(key: _onboardingKey);
    return visited == 'true';
  }
}
