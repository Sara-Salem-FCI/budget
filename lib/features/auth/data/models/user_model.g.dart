// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  profileImage: json['profile_image'] as String?,
  lang: json['lang'] as String,
  isVerified: json['is_verified'] as bool,
  latitude: json['latitude'] as String?,
  longitude: json['longitude'] as String?,
  isActive: json['is_active'] as bool,
  isNotify: json['is_notify'] as bool,
  token: json['token'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'profile_image': instance.profileImage,
  'lang': instance.lang,
  'is_verified': instance.isVerified,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'is_active': instance.isActive,
  'is_notify': instance.isNotify,
  'token': instance.token,
};
