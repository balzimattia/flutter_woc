// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CoachingRelation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CoachingRelation _$CoachingRelationFromJson(Map<String, dynamic> json) {
  return _CoachingRelation.fromJson(json);
}

/// @nodoc
mixin _$CoachingRelation {
  String get coachId => throw _privateConstructorUsedError;
  String get clienteId => throw _privateConstructorUsedError;

  /// Serializes this CoachingRelation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoachingRelation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoachingRelationCopyWith<CoachingRelation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachingRelationCopyWith<$Res> {
  factory $CoachingRelationCopyWith(
    CoachingRelation value,
    $Res Function(CoachingRelation) then,
  ) = _$CoachingRelationCopyWithImpl<$Res, CoachingRelation>;
  @useResult
  $Res call({String coachId, String clienteId});
}

/// @nodoc
class _$CoachingRelationCopyWithImpl<$Res, $Val extends CoachingRelation>
    implements $CoachingRelationCopyWith<$Res> {
  _$CoachingRelationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoachingRelation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? coachId = null, Object? clienteId = null}) {
    return _then(
      _value.copyWith(
            coachId: null == coachId
                ? _value.coachId
                : coachId // ignore: cast_nullable_to_non_nullable
                      as String,
            clienteId: null == clienteId
                ? _value.clienteId
                : clienteId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CoachingRelationImplCopyWith<$Res>
    implements $CoachingRelationCopyWith<$Res> {
  factory _$$CoachingRelationImplCopyWith(
    _$CoachingRelationImpl value,
    $Res Function(_$CoachingRelationImpl) then,
  ) = __$$CoachingRelationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String coachId, String clienteId});
}

/// @nodoc
class __$$CoachingRelationImplCopyWithImpl<$Res>
    extends _$CoachingRelationCopyWithImpl<$Res, _$CoachingRelationImpl>
    implements _$$CoachingRelationImplCopyWith<$Res> {
  __$$CoachingRelationImplCopyWithImpl(
    _$CoachingRelationImpl _value,
    $Res Function(_$CoachingRelationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CoachingRelation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? coachId = null, Object? clienteId = null}) {
    return _then(
      _$CoachingRelationImpl(
        coachId: null == coachId
            ? _value.coachId
            : coachId // ignore: cast_nullable_to_non_nullable
                  as String,
        clienteId: null == clienteId
            ? _value.clienteId
            : clienteId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CoachingRelationImpl implements _CoachingRelation {
  const _$CoachingRelationImpl({
    required this.coachId,
    required this.clienteId,
  });

  factory _$CoachingRelationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoachingRelationImplFromJson(json);

  @override
  final String coachId;
  @override
  final String clienteId;

  @override
  String toString() {
    return 'CoachingRelation(coachId: $coachId, clienteId: $clienteId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoachingRelationImpl &&
            (identical(other.coachId, coachId) || other.coachId == coachId) &&
            (identical(other.clienteId, clienteId) ||
                other.clienteId == clienteId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, coachId, clienteId);

  /// Create a copy of CoachingRelation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoachingRelationImplCopyWith<_$CoachingRelationImpl> get copyWith =>
      __$$CoachingRelationImplCopyWithImpl<_$CoachingRelationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CoachingRelationImplToJson(this);
  }
}

abstract class _CoachingRelation implements CoachingRelation {
  const factory _CoachingRelation({
    required final String coachId,
    required final String clienteId,
  }) = _$CoachingRelationImpl;

  factory _CoachingRelation.fromJson(Map<String, dynamic> json) =
      _$CoachingRelationImpl.fromJson;

  @override
  String get coachId;
  @override
  String get clienteId;

  /// Create a copy of CoachingRelation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoachingRelationImplCopyWith<_$CoachingRelationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
