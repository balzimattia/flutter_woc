// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ProgramSheet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProgramSheet _$ProgramSheetFromJson(Map<String, dynamic> json) {
  return _ProgramSheet.fromJson(json);
}

/// @nodoc
mixin _$ProgramSheet {
  int get number => throw _privateConstructorUsedError;
  List<Week> get weeks => throw _privateConstructorUsedError;

  /// Serializes this ProgramSheet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProgramSheet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgramSheetCopyWith<ProgramSheet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramSheetCopyWith<$Res> {
  factory $ProgramSheetCopyWith(
    ProgramSheet value,
    $Res Function(ProgramSheet) then,
  ) = _$ProgramSheetCopyWithImpl<$Res, ProgramSheet>;
  @useResult
  $Res call({int number, List<Week> weeks});
}

/// @nodoc
class _$ProgramSheetCopyWithImpl<$Res, $Val extends ProgramSheet>
    implements $ProgramSheetCopyWith<$Res> {
  _$ProgramSheetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgramSheet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? number = null, Object? weeks = null}) {
    return _then(
      _value.copyWith(
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            weeks: null == weeks
                ? _value.weeks
                : weeks // ignore: cast_nullable_to_non_nullable
                      as List<Week>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProgramSheetImplCopyWith<$Res>
    implements $ProgramSheetCopyWith<$Res> {
  factory _$$ProgramSheetImplCopyWith(
    _$ProgramSheetImpl value,
    $Res Function(_$ProgramSheetImpl) then,
  ) = __$$ProgramSheetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int number, List<Week> weeks});
}

/// @nodoc
class __$$ProgramSheetImplCopyWithImpl<$Res>
    extends _$ProgramSheetCopyWithImpl<$Res, _$ProgramSheetImpl>
    implements _$$ProgramSheetImplCopyWith<$Res> {
  __$$ProgramSheetImplCopyWithImpl(
    _$ProgramSheetImpl _value,
    $Res Function(_$ProgramSheetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProgramSheet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? number = null, Object? weeks = null}) {
    return _then(
      _$ProgramSheetImpl(
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        weeks: null == weeks
            ? _value._weeks
            : weeks // ignore: cast_nullable_to_non_nullable
                  as List<Week>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgramSheetImpl implements _ProgramSheet {
  const _$ProgramSheetImpl({
    required this.number,
    required final List<Week> weeks,
  }) : _weeks = weeks;

  factory _$ProgramSheetImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgramSheetImplFromJson(json);

  @override
  final int number;
  final List<Week> _weeks;
  @override
  List<Week> get weeks {
    if (_weeks is EqualUnmodifiableListView) return _weeks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeks);
  }

  @override
  String toString() {
    return 'ProgramSheet(number: $number, weeks: $weeks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramSheetImpl &&
            (identical(other.number, number) || other.number == number) &&
            const DeepCollectionEquality().equals(other._weeks, _weeks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    number,
    const DeepCollectionEquality().hash(_weeks),
  );

  /// Create a copy of ProgramSheet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramSheetImplCopyWith<_$ProgramSheetImpl> get copyWith =>
      __$$ProgramSheetImplCopyWithImpl<_$ProgramSheetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgramSheetImplToJson(this);
  }
}

abstract class _ProgramSheet implements ProgramSheet {
  const factory _ProgramSheet({
    required final int number,
    required final List<Week> weeks,
  }) = _$ProgramSheetImpl;

  factory _ProgramSheet.fromJson(Map<String, dynamic> json) =
      _$ProgramSheetImpl.fromJson;

  @override
  int get number;
  @override
  List<Week> get weeks;

  /// Create a copy of ProgramSheet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgramSheetImplCopyWith<_$ProgramSheetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Week _$WeekFromJson(Map<String, dynamic> json) {
  return _Week.fromJson(json);
}

/// @nodoc
mixin _$Week {
  int get number => throw _privateConstructorUsedError;
  List<Day> get days => throw _privateConstructorUsedError;

  /// Serializes this Week to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Week
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeekCopyWith<Week> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekCopyWith<$Res> {
  factory $WeekCopyWith(Week value, $Res Function(Week) then) =
      _$WeekCopyWithImpl<$Res, Week>;
  @useResult
  $Res call({int number, List<Day> days});
}

/// @nodoc
class _$WeekCopyWithImpl<$Res, $Val extends Week>
    implements $WeekCopyWith<$Res> {
  _$WeekCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Week
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
                      as List<Day>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeekImplCopyWith<$Res> implements $WeekCopyWith<$Res> {
  factory _$$WeekImplCopyWith(
    _$WeekImpl value,
    $Res Function(_$WeekImpl) then,
  ) = __$$WeekImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int number, List<Day> days});
}

/// @nodoc
class __$$WeekImplCopyWithImpl<$Res>
    extends _$WeekCopyWithImpl<$Res, _$WeekImpl>
    implements _$$WeekImplCopyWith<$Res> {
  __$$WeekImplCopyWithImpl(_$WeekImpl _value, $Res Function(_$WeekImpl) _then)
    : super(_value, _then);

  /// Create a copy of Week
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? number = null, Object? days = null}) {
    return _then(
      _$WeekImpl(
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        days: null == days
            ? _value._days
            : days // ignore: cast_nullable_to_non_nullable
                  as List<Day>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeekImpl implements _Week {
  const _$WeekImpl({required this.number, required final List<Day> days})
    : _days = days;

  factory _$WeekImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekImplFromJson(json);

  @override
  final int number;
  final List<Day> _days;
  @override
  List<Day> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'Week(number: $number, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekImpl &&
            (identical(other.number, number) || other.number == number) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    number,
    const DeepCollectionEquality().hash(_days),
  );

  /// Create a copy of Week
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekImplCopyWith<_$WeekImpl> get copyWith =>
      __$$WeekImplCopyWithImpl<_$WeekImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeekImplToJson(this);
  }
}

abstract class _Week implements Week {
  const factory _Week({
    required final int number,
    required final List<Day> days,
  }) = _$WeekImpl;

  factory _Week.fromJson(Map<String, dynamic> json) = _$WeekImpl.fromJson;

  @override
  int get number;
  @override
  List<Day> get days;

  /// Create a copy of Week
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeekImplCopyWith<_$WeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Day _$DayFromJson(Map<String, dynamic> json) {
  return _Day.fromJson(json);
}

/// @nodoc
mixin _$Day {
  int get number => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  List<Exercise> get exercises => throw _privateConstructorUsedError;

  /// Serializes this Day to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Day
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayCopyWith<Day> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayCopyWith<$Res> {
  factory $DayCopyWith(Day value, $Res Function(Day) then) =
      _$DayCopyWithImpl<$Res, Day>;
  @useResult
  $Res call({int number, bool isCompleted, List<Exercise> exercises});
}

/// @nodoc
class _$DayCopyWithImpl<$Res, $Val extends Day> implements $DayCopyWith<$Res> {
  _$DayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Day
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
                      as List<Exercise>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DayImplCopyWith<$Res> implements $DayCopyWith<$Res> {
  factory _$$DayImplCopyWith(_$DayImpl value, $Res Function(_$DayImpl) then) =
      __$$DayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int number, bool isCompleted, List<Exercise> exercises});
}

/// @nodoc
class __$$DayImplCopyWithImpl<$Res> extends _$DayCopyWithImpl<$Res, _$DayImpl>
    implements _$$DayImplCopyWith<$Res> {
  __$$DayImplCopyWithImpl(_$DayImpl _value, $Res Function(_$DayImpl) _then)
    : super(_value, _then);

  /// Create a copy of Day
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? isCompleted = null,
    Object? exercises = null,
  }) {
    return _then(
      _$DayImpl(
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
                  as List<Exercise>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DayImpl implements _Day {
  const _$DayImpl({
    required this.number,
    required this.isCompleted,
    required final List<Exercise> exercises,
  }) : _exercises = exercises;

  factory _$DayImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayImplFromJson(json);

  @override
  final int number;
  @override
  final bool isCompleted;
  final List<Exercise> _exercises;
  @override
  List<Exercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'Day(number: $number, isCompleted: $isCompleted, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    number,
    isCompleted,
    const DeepCollectionEquality().hash(_exercises),
  );

  /// Create a copy of Day
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayImplCopyWith<_$DayImpl> get copyWith =>
      __$$DayImplCopyWithImpl<_$DayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayImplToJson(this);
  }
}

abstract class _Day implements Day {
  const factory _Day({
    required final int number,
    required final bool isCompleted,
    required final List<Exercise> exercises,
  }) = _$DayImpl;

  factory _Day.fromJson(Map<String, dynamic> json) = _$DayImpl.fromJson;

  @override
  int get number;
  @override
  bool get isCompleted;
  @override
  List<Exercise> get exercises;

  /// Create a copy of Day
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayImplCopyWith<_$DayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return _Exercise.fromJson(json);
}

/// @nodoc
mixin _$Exercise {
  String get name => throw _privateConstructorUsedError;
  int get sets => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;
  int get rest => throw _privateConstructorUsedError; // in secondi
  double get weight => throw _privateConstructorUsedError;
  String get coachComment => throw _privateConstructorUsedError;
  String get clienteComment => throw _privateConstructorUsedError;

  /// Serializes this Exercise to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseCopyWith<Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) then) =
      _$ExerciseCopyWithImpl<$Res, Exercise>;
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
class _$ExerciseCopyWithImpl<$Res, $Val extends Exercise>
    implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Exercise
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
abstract class _$$ExerciseImplCopyWith<$Res>
    implements $ExerciseCopyWith<$Res> {
  factory _$$ExerciseImplCopyWith(
    _$ExerciseImpl value,
    $Res Function(_$ExerciseImpl) then,
  ) = __$$ExerciseImplCopyWithImpl<$Res>;
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
class __$$ExerciseImplCopyWithImpl<$Res>
    extends _$ExerciseCopyWithImpl<$Res, _$ExerciseImpl>
    implements _$$ExerciseImplCopyWith<$Res> {
  __$$ExerciseImplCopyWithImpl(
    _$ExerciseImpl _value,
    $Res Function(_$ExerciseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Exercise
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
      _$ExerciseImpl(
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
@JsonSerializable()
class _$ExerciseImpl implements _Exercise {
  const _$ExerciseImpl({
    required this.name,
    required this.sets,
    required this.reps,
    required this.rest,
    required this.weight,
    required this.coachComment,
    required this.clienteComment,
  });

  factory _$ExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseImplFromJson(json);

  @override
  final String name;
  @override
  final int sets;
  @override
  final int reps;
  @override
  final int rest;
  // in secondi
  @override
  final double weight;
  @override
  final String coachComment;
  @override
  final String clienteComment;

  @override
  String toString() {
    return 'Exercise(name: $name, sets: $sets, reps: $reps, rest: $rest, weight: $weight, coachComment: $coachComment, clienteComment: $clienteComment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      __$$ExerciseImplCopyWithImpl<_$ExerciseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseImplToJson(this);
  }
}

abstract class _Exercise implements Exercise {
  const factory _Exercise({
    required final String name,
    required final int sets,
    required final int reps,
    required final int rest,
    required final double weight,
    required final String coachComment,
    required final String clienteComment,
  }) = _$ExerciseImpl;

  factory _Exercise.fromJson(Map<String, dynamic> json) =
      _$ExerciseImpl.fromJson;

  @override
  String get name;
  @override
  int get sets;
  @override
  int get reps;
  @override
  int get rest; // in secondi
  @override
  double get weight;
  @override
  String get coachComment;
  @override
  String get clienteComment;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
