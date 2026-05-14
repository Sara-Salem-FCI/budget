import 'package:dio/dio.dart';
import 'package:budget/core/api/api_constants.dart';
import 'package:budget/core/api/api_form_fields.dart';
import '../models/user_model.dart';

/// Interface for the authentication remote data source.
abstract class AuthRemoteDataSource {
  Future<UserModel> register(Map<String, dynamic> data);
  Future<UserModel> login(Map<String, dynamic> data);
  Future<Map<String, dynamic>> forgotPassword(Map<String, dynamic> data);
  Future<Map<String, dynamic>> verifyCode(Map<String, dynamic> data);
  Future<Map<String, dynamic>> resetPassword(Map<String, dynamic> data);
  Future<Map<String, dynamic>> sendOtp(Map<String, dynamic> data);
  Future<Map<String, dynamic>> genericVerificationOtp(Map<String, dynamic> data);
  Future<Map<String, dynamic>> verifyOtp(Map<String, dynamic> data);
  Future<UserModel> guestLogin(String fcmToken);
  Future<UserModel> socialAuth(String uid, String fcmToken);
  Future<void> logout();
  Future<void> deleteAccount();
  Future<UserModel> getProfile(UserModel currentUser);



  /// Multipart `POST auth/update-profile`. Merges response [data] into [currentUser] (keeps token).
  Future<UserModel> updateProfile({
    required UserModel currentUser,
    required String name,
    required String email,
    String? imageFilePath,
  });
}

/// Implementation of [AuthRemoteDataSource] using Dio.
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<UserModel> register(Map<String, dynamic> data) async {
    final response = await _dio.post(ApiConstants.register, data: data);
    final userData = response.data['data']['user'];
    final token = response.data['data']['token'];
    return UserModel.fromJson(userData).copyWith(token: token);
  }

  @override
  Future<UserModel> login(Map<String, dynamic> data) async {
    final response = await _dio.post(ApiConstants.login, data: data);
    final userData = response.data['data']['user'];
    final token = response.data['data']['token'];
    return UserModel.fromJson(userData).copyWith(token: token);
  }

  @override
  Future<Map<String, dynamic>> forgotPassword(Map<String, dynamic> data) async {
    final response = await _dio.post(ApiConstants.forgotPassword, data: data);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> verifyCode(Map<String, dynamic> data) async {
    final response = await _dio.post(ApiConstants.verifyCode, data: data);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> resetPassword(Map<String, dynamic> data) async {
    final response = await _dio.post(ApiConstants.resetPassword, data: data);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> sendOtp(Map<String, dynamic> data) async {
    final response = await _dio.post(ApiConstants.sendOtp, data: data);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> genericVerificationOtp(Map<String, dynamic> data) async {
    final response = await _dio.post(ApiConstants.verificationOtp, data: data);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> verifyOtp(Map<String, dynamic> data) async {
    final response = await _dio.post(ApiConstants.verifyOtp, data: data);
    return response.data;
  }

  @override
  Future<UserModel> guestLogin(String fcmToken) async {
    final response = await _dio.post(ApiConstants.guest, data: {'fcm_token': fcmToken});
    final userData = response.data['data']['user'];
    final token = response.data['data']['token'];
    return UserModel.fromJson(userData).copyWith(token: token);
  }

  @override
  Future<UserModel> socialAuth(String uid, String fcmToken) async {
    final response = await _dio.post(ApiConstants.socialAuth, data: {'uid': uid, 'fcm_token': fcmToken});
    final userData = response.data['data']['user'];
    final token = response.data['data']['token'];
    return UserModel.fromJson(userData).copyWith(token: token);
  }

  @override
  Future<void> logout() async {
    await _dio.post(ApiConstants.logout);
  }

  @override
  Future<void> deleteAccount() async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiConstants.userDeleteAccount,
    );
    final data = response.data;
    if (data == null || data['success'] != true) {
      throw DioException(
        requestOptions: response.requestOptions,
        message: data?['message']?.toString(),
      );
    }
  }

  @override
  Future<UserModel> getProfile(UserModel currentUser) async {
    final response = await _dio.get(ApiConstants.getProfile);
    final userData = response.data['data'];
    return UserModel.fromUpdateProfileResponse(userData, currentUser);
  }



  @override
  Future<UserModel> updateProfile({
    required UserModel currentUser,
    required String name,
    required String email,
    String? imageFilePath,
  }) async {
    final map = <String, dynamic>{
      ApiFormFields.profileName: name,
      ApiFormFields.profileEmail: email,
    };
    if (imageFilePath != null && imageFilePath.trim().isNotEmpty) {
      map[ApiFormFields.profileImage] = await MultipartFile.fromFile(
        imageFilePath.trim(),
      );
    }
    final response = await _dio.post<Map<String, dynamic>>(
      ApiConstants.updateProfile,
      data: FormData.fromMap(map),
    );
    final body = response.data;
    if (body == null || body['success'] != true) {
      throw DioException(
        requestOptions: response.requestOptions,
        message: body?['message']?.toString(),
      );
    }
    final raw = body['data'];
    if (raw is! Map<String, dynamic>) {
      throw DioException(
        requestOptions: response.requestOptions,
        message: body['message']?.toString(),
      );
    }
    return UserModel.fromUpdateProfileResponse(raw, currentUser);
  }
}
