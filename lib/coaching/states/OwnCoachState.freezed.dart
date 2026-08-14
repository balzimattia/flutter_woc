// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'OwnCoachState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OwnCoachState {
  UserModel? get ownCoach => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasLoadingError => throw _privateConstructorUsedError;

  /// Create a copy of OwnCoachState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OwnCoachStateCopyWith<OwnCoachState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnCoachStateCopyWith<$Res> {
  factory $OwnCoachStateCopyWith(
    OwnCoachState value,
    $Res Function(OwnCoachState) then,
  ) = _$OwnCoachStateCopyWithImpl<$Res, OwnCoachState>;
  @useResult
  $Res call({UserModel? ownCoach, bool isLoading, bool hasLoadingError});

  $UserModelCopyWith<$Res>? get ownCoach;
}

/// @nodoc
class _$OwnCoachStateCopyWithImpl<$Res, $Val extends OwnCoachState>
    implements $OwnCoachStateCopyWith<$Res> {
  _$OwnCoachStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OwnCoachState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownCoach = freezed,
    Object? isLoading = null,
    Object? hasLoadingError = null,
  }) {
    return _then(
      _value.copyWith(
            ownCoach: freezed == ownCoach
                ? _value.ownCoach
                : ownCoach // ignore: cast_nullable_to_non_nullable
                      as UserModel?,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasLoadingError: null == hasLoadingError
                ? _value.hasLoadingError
                : hasLoadingError // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of OwnCoachState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get ownCoach {
    if (_value.ownCoach == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.ownCoach!, (value) {
      return _then(_value.copyWith(ownCoach: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OwnCoachStateImplCopyWith<$Res>
    implements $OwnCoachStateCopyWith<$Res> {
  factory _$$OwnCoachStateImplCopyWith(
    _$OwnCoachStateImpl value,
    $Res Function(_$OwnCoachStateImpl) then,
  ) = __$$OwnCoachStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserModel? ownCoach, bool isLoading, bool hasLoadingError});

  @override
  $UserModelCopyWith<$Res>? get ownCoach;
}

/// @nodoc
class __$$OwnCoachStateImplCopyWithImpl<$Res>
    extends _$OwnCoachStateCopyWithImpl<$Res, _$OwnCoachStateImpl>
    implements _$$OwnCoachStateImplCopyWith<$Res> {
  __$$OwnCoachStateImplCopyWithImpl(
    _$OwnCoachStateImpl _value,
    $Res Function(_$OwnCoachStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OwnCoachState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownCoach = freezed,
    Object? isLoading = null,
    Object? hasLoadingError = null,
  }) {
    return _then(
      _$OwnCoachStateImpl(
        ownCoach: freezed == ownCoach
            ? _value.ownCoach
            : ownCoach // ignore: cast_nullable_to_non_nullable
                  as UserModel?,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasLoadingError: null == hasLoadingError
            ? _value.hasLoadingError
            : hasLoadingError // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$OwnCoachStateImpl implements _OwnCoachState {
  const _$OwnCoachStateImpl({
    this.ownCoach,
    this.isLoading = false,
    this.hasLoadingError = false,
  });

  @override
  final UserModel? ownCoach;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasLoadingError;

  @override
  String toString() {
    return 'OwnCoachState(ownCoach: $ownCoach, isLoading: $isLoading, hasLoadingError: $hasLoadingError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnCoachStateImpl &&
            (identical(other.ownCoach, ownCoach) ||
                other.ownCoach == ownCoach) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasLoadingError, hasLoadingError) ||
                other.hasLoadingError == hasLoadingError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ownCoach, isLoading, hasLoadingError);

  /// Create a copy of OwnCoachState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnCoachStateImplCopyWith<_$OwnCoachStateImpl> get copyWith =>
      __$$OwnCoachStateImplCopyWithImpl<_$OwnCoachStateImpl>(this, _$identity);
}

abstract class _OwnCoachState implements OwnCoachState {
  const factory _OwnCoachState({
    final UserModel? ownCoach,
    final bool isLoading,
    final bool hasLoadingError,
  }) = _$OwnCoachStateImpl;

  @override
  UserModel? get ownCoach;
  @override
  bool get isLoading;
  @override
  bool get hasLoadingError;

  /// Create a copy of OwnCoachState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OwnCoachStateImplCopyWith<_$OwnCoachStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
