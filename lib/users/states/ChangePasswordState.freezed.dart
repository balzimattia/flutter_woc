// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ChangePasswordState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChangePasswordState {
  String get newPassword => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  String? get newPasswordError => throw _privateConstructorUsedError;
  String? get confirmPasswordError => throw _privateConstructorUsedError;
  bool get saveSuccess => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of ChangePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangePasswordStateCopyWith<ChangePasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordStateCopyWith<$Res> {
  factory $ChangePasswordStateCopyWith(
    ChangePasswordState value,
    $Res Function(ChangePasswordState) then,
  ) = _$ChangePasswordStateCopyWithImpl<$Res, ChangePasswordState>;
  @useResult
  $Res call({
    String newPassword,
    String confirmPassword,
    String? newPasswordError,
    String? confirmPasswordError,
    bool saveSuccess,
    bool isLoading,
  });
}

/// @nodoc
class _$ChangePasswordStateCopyWithImpl<$Res, $Val extends ChangePasswordState>
    implements $ChangePasswordStateCopyWith<$Res> {
  _$ChangePasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
    Object? confirmPassword = null,
    Object? newPasswordError = freezed,
    Object? confirmPasswordError = freezed,
    Object? saveSuccess = null,
    Object? isLoading = null,
  }) {
    return _then(
      _value.copyWith(
            newPassword: null == newPassword
                ? _value.newPassword
                : newPassword // ignore: cast_nullable_to_non_nullable
                      as String,
            confirmPassword: null == confirmPassword
                ? _value.confirmPassword
                : confirmPassword // ignore: cast_nullable_to_non_nullable
                      as String,
            newPasswordError: freezed == newPasswordError
                ? _value.newPasswordError
                : newPasswordError // ignore: cast_nullable_to_non_nullable
                      as String?,
            confirmPasswordError: freezed == confirmPasswordError
                ? _value.confirmPasswordError
                : confirmPasswordError // ignore: cast_nullable_to_non_nullable
                      as String?,
            saveSuccess: null == saveSuccess
                ? _value.saveSuccess
                : saveSuccess // ignore: cast_nullable_to_non_nullable
                      as bool,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChangePasswordStateImplCopyWith<$Res>
    implements $ChangePasswordStateCopyWith<$Res> {
  factory _$$ChangePasswordStateImplCopyWith(
    _$ChangePasswordStateImpl value,
    $Res Function(_$ChangePasswordStateImpl) then,
  ) = __$$ChangePasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String newPassword,
    String confirmPassword,
    String? newPasswordError,
    String? confirmPasswordError,
    bool saveSuccess,
    bool isLoading,
  });
}

/// @nodoc
class __$$ChangePasswordStateImplCopyWithImpl<$Res>
    extends _$ChangePasswordStateCopyWithImpl<$Res, _$ChangePasswordStateImpl>
    implements _$$ChangePasswordStateImplCopyWith<$Res> {
  __$$ChangePasswordStateImplCopyWithImpl(
    _$ChangePasswordStateImpl _value,
    $Res Function(_$ChangePasswordStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChangePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
    Object? confirmPassword = null,
    Object? newPasswordError = freezed,
    Object? confirmPasswordError = freezed,
    Object? saveSuccess = null,
    Object? isLoading = null,
  }) {
    return _then(
      _$ChangePasswordStateImpl(
        newPassword: null == newPassword
            ? _value.newPassword
            : newPassword // ignore: cast_nullable_to_non_nullable
                  as String,
        confirmPassword: null == confirmPassword
            ? _value.confirmPassword
            : confirmPassword // ignore: cast_nullable_to_non_nullable
                  as String,
        newPasswordError: freezed == newPasswordError
            ? _value.newPasswordError
            : newPasswordError // ignore: cast_nullable_to_non_nullable
                  as String?,
        confirmPasswordError: freezed == confirmPasswordError
            ? _value.confirmPasswordError
            : confirmPasswordError // ignore: cast_nullable_to_non_nullable
                  as String?,
        saveSuccess: null == saveSuccess
            ? _value.saveSuccess
            : saveSuccess // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$ChangePasswordStateImpl implements _ChangePasswordState {
  const _$ChangePasswordStateImpl({
    this.newPassword = '',
    this.confirmPassword = '',
    this.newPasswordError = null,
    this.confirmPasswordError = null,
    this.saveSuccess = false,
    this.isLoading = false,
  });

  @override
  @JsonKey()
  final String newPassword;
  @override
  @JsonKey()
  final String confirmPassword;
  @override
  @JsonKey()
  final String? newPasswordError;
  @override
  @JsonKey()
  final String? confirmPasswordError;
  @override
  @JsonKey()
  final bool saveSuccess;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ChangePasswordState(newPassword: $newPassword, confirmPassword: $confirmPassword, newPasswordError: $newPasswordError, confirmPasswordError: $confirmPasswordError, saveSuccess: $saveSuccess, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordStateImpl &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.newPasswordError, newPasswordError) ||
                other.newPasswordError == newPasswordError) &&
            (identical(other.confirmPasswordError, confirmPasswordError) ||
                other.confirmPasswordError == confirmPasswordError) &&
            (identical(other.saveSuccess, saveSuccess) ||
                other.saveSuccess == saveSuccess) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    newPassword,
    confirmPassword,
    newPasswordError,
    confirmPasswordError,
    saveSuccess,
    isLoading,
  );

  /// Create a copy of ChangePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordStateImplCopyWith<_$ChangePasswordStateImpl> get copyWith =>
      __$$ChangePasswordStateImplCopyWithImpl<_$ChangePasswordStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ChangePasswordState implements ChangePasswordState {
  const factory _ChangePasswordState({
    final String newPassword,
    final String confirmPassword,
    final String? newPasswordError,
    final String? confirmPasswordError,
    final bool saveSuccess,
    final bool isLoading,
  }) = _$ChangePasswordStateImpl;

  @override
  String get newPassword;
  @override
  String get confirmPassword;
  @override
  String? get newPasswordError;
  @override
  String? get confirmPasswordError;
  @override
  bool get saveSuccess;
  @override
  bool get isLoading;

  /// Create a copy of ChangePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePasswordStateImplCopyWith<_$ChangePasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
