import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserModel.freezed.dart';
part 'UserModel.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required UserRole role,
    required String email
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}


enum UserRole {
  @JsonValue('Cliente')
  cliente('Cliente'),

  @JsonValue('Coach')
  coach('Coach');

  final String toRoleString;

  const UserRole(this.toRoleString);
}