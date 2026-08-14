// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'UsersDevicesToken.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UsersDevicesToken _$UsersDevicesTokenFromJson(Map<String, dynamic> json) {
  return _UsersDevicesToken.fromJson(json);
}

/// @nodoc
mixin _$UsersDevicesToken {
  String get userId => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  String? get fcmToken => throw _privateConstructorUsedError;

  /// Serializes this UsersDevicesToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsersDevicesToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsersDevicesTokenCopyWith<UsersDevicesToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersDevicesTokenCopyWith<$Res> {
  factory $UsersDevicesTokenCopyWith(
    UsersDevicesToken value,
    $Res Function(UsersDevicesToken) then,
  ) = _$UsersDevicesTokenCopyWithImpl<$Res, UsersDevicesToken>;
  @useResult
  $Res call({String userId, String deviceId, String? fcmToken});
}

/// @nodoc
class _$UsersDevicesTokenCopyWithImpl<$Res, $Val extends UsersDevicesToken>
    implements $UsersDevicesTokenCopyWith<$Res> {
  _$UsersDevicesTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsersDevicesToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? deviceId = null,
    Object? fcmToken = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            deviceId: null == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as String,
            fcmToken: freezed == fcmToken
                ? _value.fcmToken
                : fcmToken // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UsersDevicesTokenImplCopyWith<$Res>
    implements $UsersDevicesTokenCopyWith<$Res> {
  factory _$$UsersDevicesTokenImplCopyWith(
    _$UsersDevicesTokenImpl value,
    $Res Function(_$UsersDevicesTokenImpl) then,
  ) = __$$UsersDevicesTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String deviceId, String? fcmToken});
}

/// @nodoc
class __$$UsersDevicesTokenImplCopyWithImpl<$Res>
    extends _$UsersDevicesTokenCopyWithImpl<$Res, _$UsersDevicesTokenImpl>
    implements _$$UsersDevicesTokenImplCopyWith<$Res> {
  __$$UsersDevicesTokenImplCopyWithImpl(
    _$UsersDevicesTokenImpl _value,
    $Res Function(_$UsersDevicesTokenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsersDevicesToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? deviceId = null,
    Object? fcmToken = freezed,
  }) {
    return _then(
      _$UsersDevicesTokenImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceId: null == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as String,
        fcmToken: freezed == fcmToken
            ? _value.fcmToken
            : fcmToken // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersDevicesTokenImpl implements _UsersDevicesToken {
  const _$UsersDevicesTokenImpl({
    required this.userId,
    required this.deviceId,
    required this.fcmToken,
  });

  factory _$UsersDevicesTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersDevicesTokenImplFromJson(json);

  @override
  final String userId;
  @override
  final String deviceId;
  @override
  final String? fcmToken;

  @override
  String toString() {
    return 'UsersDevicesToken(userId: $userId, deviceId: $deviceId, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersDevicesTokenImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, deviceId, fcmToken);

  /// Create a copy of UsersDevicesToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersDevicesTokenImplCopyWith<_$UsersDevicesTokenImpl> get copyWith =>
      __$$UsersDevicesTokenImplCopyWithImpl<_$UsersDevicesTokenImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersDevicesTokenImplToJson(this);
  }
}

abstract class _UsersDevicesToken implements UsersDevicesToken {
  const factory _UsersDevicesToken({
    required final String userId,
    required final String deviceId,
    required final String? fcmToken,
  }) = _$UsersDevicesTokenImpl;

  factory _UsersDevicesToken.fromJson(Map<String, dynamic> json) =
      _$UsersDevicesTokenImpl.fromJson;

  @override
  String get userId;
  @override
  String get deviceId;
  @override
  String? get fcmToken;

  /// Create a copy of UsersDevicesToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersDevicesTokenImplCopyWith<_$UsersDevicesTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
