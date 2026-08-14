// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CoachingRequest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CoachingRequest _$CoachingRequestFromJson(Map<String, dynamic> json) {
  return _CoachingRequest.fromJson(json);
}

/// @nodoc
mixin _$CoachingRequest {
  String get coachId => throw _privateConstructorUsedError;
  String get clienteId => throw _privateConstructorUsedError;
  RequestStatus get status => throw _privateConstructorUsedError;

  /// Serializes this CoachingRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoachingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoachingRequestCopyWith<CoachingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachingRequestCopyWith<$Res> {
  factory $CoachingRequestCopyWith(
    CoachingRequest value,
    $Res Function(CoachingRequest) then,
  ) = _$CoachingRequestCopyWithImpl<$Res, CoachingRequest>;
  @useResult
  $Res call({String coachId, String clienteId, RequestStatus status});
}

/// @nodoc
class _$CoachingRequestCopyWithImpl<$Res, $Val extends CoachingRequest>
    implements $CoachingRequestCopyWith<$Res> {
  _$CoachingRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoachingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coachId = null,
    Object? clienteId = null,
    Object? status = null,
  }) {
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
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as RequestStatus,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CoachingRequestImplCopyWith<$Res>
    implements $CoachingRequestCopyWith<$Res> {
  factory _$$CoachingRequestImplCopyWith(
    _$CoachingRequestImpl value,
    $Res Function(_$CoachingRequestImpl) then,
  ) = __$$CoachingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String coachId, String clienteId, RequestStatus status});
}

/// @nodoc
class __$$CoachingRequestImplCopyWithImpl<$Res>
    extends _$CoachingRequestCopyWithImpl<$Res, _$CoachingRequestImpl>
    implements _$$CoachingRequestImplCopyWith<$Res> {
  __$$CoachingRequestImplCopyWithImpl(
    _$CoachingRequestImpl _value,
    $Res Function(_$CoachingRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CoachingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coachId = null,
    Object? clienteId = null,
    Object? status = null,
  }) {
    return _then(
      _$CoachingRequestImpl(
        coachId: null == coachId
            ? _value.coachId
            : coachId // ignore: cast_nullable_to_non_nullable
                  as String,
        clienteId: null == clienteId
            ? _value.clienteId
            : clienteId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RequestStatus,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CoachingRequestImpl implements _CoachingRequest {
  const _$CoachingRequestImpl({
    required this.coachId,
    required this.clienteId,
    required this.status,
  });

  factory _$CoachingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoachingRequestImplFromJson(json);

  @override
  final String coachId;
  @override
  final String clienteId;
  @override
  final RequestStatus status;

  @override
  String toString() {
    return 'CoachingRequest(coachId: $coachId, clienteId: $clienteId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoachingRequestImpl &&
            (identical(other.coachId, coachId) || other.coachId == coachId) &&
            (identical(other.clienteId, clienteId) ||
                other.clienteId == clienteId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, coachId, clienteId, status);

  /// Create a copy of CoachingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoachingRequestImplCopyWith<_$CoachingRequestImpl> get copyWith =>
      __$$CoachingRequestImplCopyWithImpl<_$CoachingRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CoachingRequestImplToJson(this);
  }
}

abstract class _CoachingRequest implements CoachingRequest {
  const factory _CoachingRequest({
    required final String coachId,
    required final String clienteId,
    required final RequestStatus status,
  }) = _$CoachingRequestImpl;

  factory _CoachingRequest.fromJson(Map<String, dynamic> json) =
      _$CoachingRequestImpl.fromJson;

  @override
  String get coachId;
  @override
  String get clienteId;
  @override
  RequestStatus get status;

  /// Create a copy of CoachingRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoachingRequestImplCopyWith<_$CoachingRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
