import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String? profileImage;
  final String lang;
  final bool isVerified;
  final String? latitude;
  final String? longitude;
  final bool isActive;
  final bool isNotify;
  final String? token; // Added to simplify auth handling

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.profileImage,
    required this.lang,
    required this.isVerified,
    this.latitude,
    this.longitude,
    required this.isActive,
    required this.isNotify,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? profileImage,
    String? lang,
    bool? isVerified,
    String? latitude,
    String? longitude,
    bool? isActive,
    bool? isNotify,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      lang: lang ?? this.lang,
      isVerified: isVerified ?? this.isVerified,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isActive: isActive ?? this.isActive,
      isNotify: isNotify ?? this.isNotify,
      token: token ?? this.token,
    );
  }

  /// Merges `data` from `POST auth/update-profile` with [current] (keeps auth token).
  factory UserModel.fromUpdateProfileResponse(
    Map<String, dynamic> data,
    UserModel current,
  ) {
    return current.copyWith(
      id: (data['id'] as num?)?.toInt(),
      name: data['name'] as String?,
      email: data['email'] as String?,
      phone: data['phone'] as String?,
      profileImage: data['profile_image'] as String?,
      lang: data['lang'] as String?,
      isVerified: data['is_verified'] as bool?,
      latitude: data['latitude'] as String?,
      longitude: data['longitude'] as String?,
      isActive: data['is_active'] as bool?,
      isNotify: data['is_notify'] as bool?,
      token: current.token,
    );
  }
}
