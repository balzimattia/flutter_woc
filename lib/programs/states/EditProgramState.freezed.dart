// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'EditProgramState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ExerciseState {
  String get name => throw _privateConstructorUsedError;
  int get sets => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;
  int get rest => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  String get coachComment => throw _privateConstructorUsedError;
  String get clienteComment => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseStateCopyWith<ExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseStateCopyWith<$Res> {
  factory $ExerciseStateCopyWith(
    ExerciseState value,
    $Res Function(ExerciseState) then,
  ) = _$ExerciseStateCopyWithImpl<$Res, ExerciseState>;
  @useResult
  $Res call({
    String name,
    int sets,
    int reps,
    int rest,
    double weight,
    String coachComment,
    String clienteComment,
  });
}

/// @nodoc
class _$ExerciseStateCopyWithImpl<$Res, $Val extends ExerciseState>
    implements $ExerciseStateCopyWith<$Res> {
  _$ExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? sets = null,
    Object? reps = null,
    Object? rest = null,
    Object? weight = null,
    Object? coachComment = null,
    Object? clienteComment = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            sets: null == sets
                ? _value.sets
                : sets // ignore: cast_nullable_to_non_nullable
                      as int,
            reps: null == reps
                ? _value.reps
                : reps // ignore: cast_nullable_to_non_nullable
                      as int,
            rest: null == rest
                ? _value.rest
                : rest // ignore: cast_nullable_to_non_nullable
                      as int,
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as double,
            coachComment: null == coachComment
                ? _value.coachComment
                : coachComment // ignore: cast_nullable_to_non_nullable
                      as String,
            clienteComment: null == clienteComment
                ? _value.clienteComment
                : clienteComment // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciseStateImplCopyWith<$Res>
    implements $ExerciseStateCopyWith<$Res> {
  factory _$$ExerciseStateImplCopyWith(
    _$ExerciseStateImpl value,
    $Res Function(_$ExerciseStateImpl) then,
  ) = __$$ExerciseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    int sets,
    int reps,
    int rest,
    double weight,
    String coachComment,
    String clienteComment,
  });
}

/// @nodoc
class __$$ExerciseStateImplCopyWithImpl<$Res>
    extends _$ExerciseStateCopyWithImpl<$Res, _$ExerciseStateImpl>
    implements _$$ExerciseStateImplCopyWith<$Res> {
  __$$ExerciseStateImplCopyWithImpl(
    _$ExerciseStateImpl _value,
    $Res Function(_$ExerciseStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? sets = null,
    Object? reps = null,
    Object? rest = null,
    Object? weight = null,
    Object? coachComment = null,
    Object? clienteComment = null,
  }) {
    return _then(
      _$ExerciseStateImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        sets: null == sets
            ? _value.sets
            : sets // ignore: cast_nullable_to_non_nullable
                  as int,
        reps: null == reps
            ? _value.reps
            : reps // ignore: cast_nullable_to_non_nullable
                  as int,
        rest: null == rest
            ? _value.rest
            : rest // ignore: cast_nullable_to_non_nullable
                  as int,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double,
        coachComment: null == coachComment
            ? _value.coachComment
            : coachComment // ignore: cast_nullable_to_non_nullable
                  as String,
        clienteComment: null == clienteComment
            ? _value.clienteComment
            : clienteComment // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ExerciseStateImpl implements _ExerciseState {
  const _$ExerciseStateImpl({
    this.name = '',
    this.sets = 0,
    this.reps = 0,
    this.rest = 0,
    this.weight = 0.0,
    this.coachComment = '',
    this.clienteComment = '',
  });

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int sets;
  @override
  @JsonKey()
  final int reps;
  @override
  @JsonKey()
  final int rest;
  @override
  @JsonKey()
  final double weight;
  @override
  @JsonKey()
  final String coachComment;
  @override
  @JsonKey()
  final String clienteComment;

  @override
  String toString() {
    return 'ExerciseState(name: $name, sets: $sets, reps: $reps, rest: $rest, weight: $weight, coachComment: $coachComment, clienteComment: $clienteComment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.rest, rest) || other.rest == rest) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.coachComment, coachComment) ||
                other.coachComment == coachComment) &&
            (identical(other.clienteComment, clienteComment) ||
                other.clienteComment == clienteComment));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    sets,
    reps,
    rest,
    weight,
    coachComment,
    clienteComment,
  );

  /// Create a copy of ExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseStateImplCopyWith<_$ExerciseStateImpl> get copyWith =>
      __$$ExerciseStateImplCopyWithImpl<_$ExerciseStateImpl>(this, _$identity);
}

abstract class _ExerciseState implements ExerciseState {
  const factory _ExerciseState({
    final String name,
    final int sets,
    final int reps,
    final int rest,
    final double weight,
    final String coachComment,
    final String clienteComment,
  }) = _$ExerciseStateImpl;

  @override
  String get name;
  @override
  int get sets;
  @override
  int get reps;
  @override
  int get rest;
  @override
  double get weight;
  @override
  String get coachComment;
  @override
  String get clienteComment;

  /// Create a copy of ExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseStateImplCopyWith<_$ExerciseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DayState {
  int get number => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  List<ExerciseState> get exercises => throw _privateConstructorUsedError;

  /// Create a copy of DayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayStateCopyWith<DayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayStateCopyWith<$Res> {
  factory $DayStateCopyWith(DayState value, $Res Function(DayState) then) =
      _$DayStateCopyWithImpl<$Res, DayState>;
  @useResult
  $Res call({int number, bool isCompleted, List<ExerciseState> exercises});
}

/// @nodoc
class _$DayStateCopyWithImpl<$Res, $Val extends DayState>
    implements $DayStateCopyWith<$Res> {
  _$DayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? isCompleted = null,
    Object? exercises = null,
  }) {
    return _then(
      _value.copyWith(
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            isCompleted: null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<ExerciseState>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DayStateImplCopyWith<$Res>
    implements $DayStateCopyWith<$Res> {
  factory _$$DayStateImplCopyWith(
    _$DayStateImpl value,
    $Res Function(_$DayStateImpl) then,
  ) = __$$DayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int number, bool isCompleted, List<ExerciseState> exercises});
}

/// @nodoc
class __$$DayStateImplCopyWithImpl<$Res>
    extends _$DayStateCopyWithImpl<$Res, _$DayStateImpl>
    implements _$$DayStateImplCopyWith<$Res> {
  __$$DayStateImplCopyWithImpl(
    _$DayStateImpl _value,
    $Res Function(_$DayStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DayState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? isCompleted = null,
    Object? exercises = null,
  }) {
    return _then(
      _$DayStateImpl(
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        isCompleted: null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<ExerciseState>,
      ),
    );
  }
}

/// @nodoc

class _$DayStateImpl implements _DayState {
  const _$DayStateImpl({
    required this.number,
    this.isCompleted = false,
    final List<ExerciseState> exercises = const [],
  }) : _exercises = exercises;

  @override
  final int number;
  @override
  @JsonKey()
  final bool isCompleted;
  final List<ExerciseState> _exercises;
  @override
  @JsonKey()
  List<ExerciseState> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'DayState(number: $number, isCompleted: $isCompleted, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayStateImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    number,
    isCompleted,
    const DeepCollectionEquality().hash(_exercises),
  );

  /// Create a copy of DayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayStateImplCopyWith<_$DayStateImpl> get copyWith =>
      __$$DayStateImplCopyWithImpl<_$DayStateImpl>(this, _$identity);
}

abstract class _DayState implements DayState {
  const factory _DayState({
    required final int number,
    final bool isCompleted,
    final List<ExerciseState> exercises,
  }) = _$DayStateImpl;

  @override
  int get number;
  @override
  bool get isCompleted;
  @override
  List<ExerciseState> get exercises;

  /// Create a copy of DayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayStateImplCopyWith<_$DayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WeekState {
  int get number => throw _privateConstructorUsedError;
  List<DayState> get days => throw _privateConstructorUsedError;

  /// Create a copy of WeekState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeekStateCopyWith<WeekState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekStateCopyWith<$Res> {
  factory $WeekStateCopyWith(WeekState value, $Res Function(WeekState) then) =
      _$WeekStateCopyWithImpl<$Res, WeekState>;
  @useResult
  $Res call({int number, List<DayState> days});
}

/// @nodoc
class _$WeekStateCopyWithImpl<$Res, $Val extends WeekState>
    implements $WeekStateCopyWith<$Res> {
  _$WeekStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeekState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? number = null, Object? days = null}) {
    return _then(
      _value.copyWith(
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            days: null == days
                ? _value.days
                : days // ignore: cast_nullable_to_non_nullable
                      as List<DayState>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeekStateImplCopyWith<$Res>
    implements $WeekStateCopyWith<$Res> {
  factory _$$WeekStateImplCopyWith(
    _$WeekStateImpl value,
    $Res Function(_$WeekStateImpl) then,
  ) = __$$WeekStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int number, List<DayState> days});
}

/// @nodoc
class __$$WeekStateImplCopyWithImpl<$Res>
    extends _$WeekStateCopyWithImpl<$Res, _$WeekStateImpl>
    implements _$$WeekStateImplCopyWith<$Res> {
  __$$WeekStateImplCopyWithImpl(
    _$WeekStateImpl _value,
    $Res Function(_$WeekStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeekState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? number = null, Object? days = null}) {
    return _then(
      _$WeekStateImpl(
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        days: null == days
            ? _value._days
            : days // ignore: cast_nullable_to_non_nullable
                  as List<DayState>,
      ),
    );
  }
}

/// @nodoc

class _$WeekStateImpl implements _WeekState {
  const _$WeekStateImpl({
    required this.number,
    final List<DayState> days = const [],
  }) : _days = days;

  @override
  final int number;
  final List<DayState> _days;
  @override
  @JsonKey()
  List<DayState> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'WeekState(number: $number, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekStateImpl &&
            (identical(other.number, number) || other.number == number) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    number,
    const DeepCollectionEquality().hash(_days),
  );

  /// Create a copy of WeekState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekStateImplCopyWith<_$WeekStateImpl> get copyWith =>
      __$$WeekStateImplCopyWithImpl<_$WeekStateImpl>(this, _$identity);
}

abstract class _WeekState implements WeekState {
  const factory _WeekState({
    required final int number,
    final List<DayState> days,
  }) = _$WeekStateImpl;

  @override
  int get number;
  @override
  List<DayState> get days;

  /// Create a copy of WeekState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeekStateImplCopyWith<_$WeekStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EditProgramState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isNewProgram => throw _privateConstructorUsedError;
  int get programNumber => throw _privateConstructorUsedError;
  List<WeekState> get weeks => throw _privateConstructorUsedError;
  bool get saveSuccess => throw _privateConstructorUsedError;

  /// Create a copy of EditProgramState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditProgramStateCopyWith<EditProgramState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProgramStateCopyWith<$Res> {
  factory $EditProgramStateCopyWith(
    EditProgramState value,
    $Res Function(EditProgramState) then,
  ) = _$EditProgramStateCopyWithImpl<$Res, EditProgramState>;
  @useResult
  $Res call({
    bool isLoading,
    bool isNewProgram,
    int programNumber,
    List<WeekState> weeks,
    bool saveSuccess,
  });
}

/// @nodoc
class _$EditProgramStateCopyWithImpl<$Res, $Val extends EditProgramState>
    implements $EditProgramStateCopyWith<$Res> {
  _$EditProgramStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditProgramState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isNewProgram = null,
    Object? programNumber = null,
    Object? weeks = null,
    Object? saveSuccess = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isNewProgram: null == isNewProgram
                ? _value.isNewProgram
                : isNewProgram // ignore: cast_nullable_to_non_nullable
                      as bool,
            programNumber: null == programNumber
                ? _value.programNumber
                : programNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            weeks: null == weeks
                ? _value.weeks
                : weeks // ignore: cast_nullable_to_non_nullable
                      as List<WeekState>,
            saveSuccess: null == saveSuccess
                ? _value.saveSuccess
                : saveSuccess // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EditProgramStateImplCopyWith<$Res>
    implements $EditProgramStateCopyWith<$Res> {
  factory _$$EditProgramStateImplCopyWith(
    _$EditProgramStateImpl value,
    $Res Function(_$EditProgramStateImpl) then,
  ) = __$$EditProgramStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool isNewProgram,
    int programNumber,
    List<WeekState> weeks,
    bool saveSuccess,
  });
}

/// @nodoc
class __$$EditProgramStateImplCopyWithImpl<$Res>
    extends _$EditProgramStateCopyWithImpl<$Res, _$EditProgramStateImpl>
    implements _$$EditProgramStateImplCopyWith<$Res> {
  __$$EditProgramStateImplCopyWithImpl(
    _$EditProgramStateImpl _value,
    $Res Function(_$EditProgramStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EditProgramState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isNewProgram = null,
    Object? programNumber = null,
    Object? weeks = null,
    Object? saveSuccess = null,
  }) {
    return _then(
      _$EditProgramStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isNewProgram: null == isNewProgram
            ? _value.isNewProgram
            : isNewProgram // ignore: cast_nullable_to_non_nullable
                  as bool,
        programNumber: null == programNumber
            ? _value.programNumber
            : programNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        weeks: null == weeks
            ? _value._weeks
            : weeks // ignore: cast_nullable_to_non_nullable
                  as List<WeekState>,
        saveSuccess: null == saveSuccess
            ? _value.saveSuccess
            : saveSuccess // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$EditProgramStateImpl implements _EditProgramState {
  const _$EditProgramStateImpl({
    this.isLoading = false,
    this.isNewProgram = true,
    this.programNumber = 0,
    final List<WeekState> weeks = const [],
    this.saveSuccess = false,
  }) : _weeks = weeks;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isNewProgram;
  @override
  @JsonKey()
  final int programNumber;
  final List<WeekState> _weeks;
  @override
  @JsonKey()
  List<WeekState> get weeks {
    if (_weeks is EqualUnmodifiableListView) return _weeks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeks);
  }

  @override
  @JsonKey()
  final bool saveSuccess;

  @override
  String toString() {
    return 'EditProgramState(isLoading: $isLoading, isNewProgram: $isNewProgram, programNumber: $programNumber, weeks: $weeks, saveSuccess: $saveSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProgramStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isNewProgram, isNewProgram) ||
                other.isNewProgram == isNewProgram) &&
            (identical(other.programNumber, programNumber) ||
                other.programNumber == programNumber) &&
            const DeepCollectionEquality().equals(other._weeks, _weeks) &&
            (identical(other.saveSuccess, saveSuccess) ||
                other.saveSuccess == saveSuccess));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isNewProgram,
    programNumber,
    const DeepCollectionEquality().hash(_weeks),
    saveSuccess,
  );

  /// Create a copy of EditProgramState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProgramStateImplCopyWith<_$EditProgramStateImpl> get copyWith =>
      __$$EditProgramStateImplCopyWithImpl<_$EditProgramStateImpl>(
        this,
        _$identity,
      );
}

abstract class _EditProgramState implements EditProgramState {
  const factory _EditProgramState({
    final bool isLoading,
    final bool isNewProgram,
    final int programNumber,
    final List<WeekState> weeks,
    final bool saveSuccess,
  }) = _$EditProgramStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isNewProgram;
  @override
  int get programNumber;
  @override
  List<WeekState> get weeks;
  @override
  bool get saveSuccess;

  /// Create a copy of EditProgramState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditProgramStateImplCopyWith<_$EditProgramStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
