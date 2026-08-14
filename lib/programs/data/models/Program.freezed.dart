// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Program.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Program _$ProgramFromJson(Map<String, dynamic> json) {
  return _Program.fromJson(json);
}

/// @nodoc
mixin _$Program {
  String get coachId => throw _privateConstructorUsedError;
  String get clienteId => throw _privateConstructorUsedError;
  List<ProgramSheet> get program => throw _privateConstructorUsedError;
  int? get latestProgramNum => throw _privateConstructorUsedError;

  /// Serializes this Program to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Program
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgramCopyWith<Program> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramCopyWith<$Res> {
  factory $ProgramCopyWith(Program value, $Res Function(Program) then) =
      _$ProgramCopyWithImpl<$Res, Program>;
  @useResult
  $Res call({
    String coachId,
    String clienteId,
    List<ProgramSheet> program,
    int? latestProgramNum,
  });
}

/// @nodoc
class _$ProgramCopyWithImpl<$Res, $Val extends Program>
    implements $ProgramCopyWith<$Res> {
  _$ProgramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Program
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coachId = null,
    Object? clienteId = null,
    Object? program = null,
    Object? latestProgramNum = freezed,
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
            program: null == program
                ? _value.program
                : program // ignore: cast_nullable_to_non_nullable
                      as List<ProgramSheet>,
            latestProgramNum: freezed == latestProgramNum
                ? _value.latestProgramNum
                : latestProgramNum // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProgramImplCopyWith<$Res> implements $ProgramCopyWith<$Res> {
  factory _$$ProgramImplCopyWith(
    _$ProgramImpl value,
    $Res Function(_$ProgramImpl) then,
  ) = __$$ProgramImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String coachId,
    String clienteId,
    List<ProgramSheet> program,
    int? latestProgramNum,
  });
}

/// @nodoc
class __$$ProgramImplCopyWithImpl<$Res>
    extends _$ProgramCopyWithImpl<$Res, _$ProgramImpl>
    implements _$$ProgramImplCopyWith<$Res> {
  __$$ProgramImplCopyWithImpl(
    _$ProgramImpl _value,
    $Res Function(_$ProgramImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Program
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coachId = null,
    Object? clienteId = null,
    Object? program = null,
    Object? latestProgramNum = freezed,
  }) {
    return _then(
      _$ProgramImpl(
        coachId: null == coachId
            ? _value.coachId
            : coachId // ignore: cast_nullable_to_non_nullable
                  as String,
        clienteId: null == clienteId
            ? _value.clienteId
            : clienteId // ignore: cast_nullable_to_non_nullable
                  as String,
        program: null == program
            ? _value._program
            : program // ignore: cast_nullable_to_non_nullable
                  as List<ProgramSheet>,
        latestProgramNum: freezed == latestProgramNum
            ? _value.latestProgramNum
            : latestProgramNum // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgramImpl implements _Program {
  const _$ProgramImpl({
    required this.coachId,
    required this.clienteId,
    required final List<ProgramSheet> program,
    required this.latestProgramNum,
  }) : _program = program;

  factory _$ProgramImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgramImplFromJson(json);

  @override
  final String coachId;
  @override
  final String clienteId;
  final List<ProgramSheet> _program;
  @override
  List<ProgramSheet> get program {
    if (_program is EqualUnmodifiableListView) return _program;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_program);
  }

  @override
  final int? latestProgramNum;

  @override
  String toString() {
    return 'Program(coachId: $coachId, clienteId: $clienteId, program: $program, latestProgramNum: $latestProgramNum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramImpl &&
            (identical(other.coachId, coachId) || other.coachId == coachId) &&
            (identical(other.clienteId, clienteId) ||
                other.clienteId == clienteId) &&
            const DeepCollectionEquality().equals(other._program, _program) &&
            (identical(other.latestProgramNum, latestProgramNum) ||
                other.latestProgramNum == latestProgramNum));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    coachId,
    clienteId,
    const DeepCollectionEquality().hash(_program),
    latestProgramNum,
  );

  /// Create a copy of Program
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramImplCopyWith<_$ProgramImpl> get copyWith =>
      __$$ProgramImplCopyWithImpl<_$ProgramImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgramImplToJson(this);
  }
}

abstract class _Program implements Program {
  const factory _Program({
    required final String coachId,
    required final String clienteId,
    required final List<ProgramSheet> program,
    required final int? latestProgramNum,
  }) = _$ProgramImpl;

  factory _Program.fromJson(Map<String, dynamic> json) = _$ProgramImpl.fromJson;

  @override
  String get coachId;
  @override
  String get clienteId;
  @override
  List<ProgramSheet> get program;
  @override
  int? get latestProgramNum;

  /// Create a copy of Program
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgramImplCopyWith<_$ProgramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
