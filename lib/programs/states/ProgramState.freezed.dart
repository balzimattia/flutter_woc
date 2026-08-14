// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ProgramState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProgramState {
  ProgramSheet? get currentProgram => throw _privateConstructorUsedError;
  int? get currentWeekNumber => throw _privateConstructorUsedError;
  int? get currentDayNumber => throw _privateConstructorUsedError;
  bool get isLoadingScreen => throw _privateConstructorUsedError;
  bool get isLoadingWeeks => throw _privateConstructorUsedError;

  /// Create a copy of ProgramState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgramStateCopyWith<ProgramState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramStateCopyWith<$Res> {
  factory $ProgramStateCopyWith(
    ProgramState value,
    $Res Function(ProgramState) then,
  ) = _$ProgramStateCopyWithImpl<$Res, ProgramState>;
  @useResult
  $Res call({
    ProgramSheet? currentProgram,
    int? currentWeekNumber,
    int? currentDayNumber,
    bool isLoadingScreen,
    bool isLoadingWeeks,
  });

  $ProgramSheetCopyWith<$Res>? get currentProgram;
}

/// @nodoc
class _$ProgramStateCopyWithImpl<$Res, $Val extends ProgramState>
    implements $ProgramStateCopyWith<$Res> {
  _$ProgramStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgramState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentProgram = freezed,
    Object? currentWeekNumber = freezed,
    Object? currentDayNumber = freezed,
    Object? isLoadingScreen = null,
    Object? isLoadingWeeks = null,
  }) {
    return _then(
      _value.copyWith(
            currentProgram: freezed == currentProgram
                ? _value.currentProgram
                : currentProgram // ignore: cast_nullable_to_non_nullable
                      as ProgramSheet?,
            currentWeekNumber: freezed == currentWeekNumber
                ? _value.currentWeekNumber
                : currentWeekNumber // ignore: cast_nullable_to_non_nullable
                      as int?,
            currentDayNumber: freezed == currentDayNumber
                ? _value.currentDayNumber
                : currentDayNumber // ignore: cast_nullable_to_non_nullable
                      as int?,
            isLoadingScreen: null == isLoadingScreen
                ? _value.isLoadingScreen
                : isLoadingScreen // ignore: cast_nullable_to_non_nullable
                      as bool,
            isLoadingWeeks: null == isLoadingWeeks
                ? _value.isLoadingWeeks
                : isLoadingWeeks // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of ProgramState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProgramSheetCopyWith<$Res>? get currentProgram {
    if (_value.currentProgram == null) {
      return null;
    }

    return $ProgramSheetCopyWith<$Res>(_value.currentProgram!, (value) {
      return _then(_value.copyWith(currentProgram: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProgramStateImplCopyWith<$Res>
    implements $ProgramStateCopyWith<$Res> {
  factory _$$ProgramStateImplCopyWith(
    _$ProgramStateImpl value,
    $Res Function(_$ProgramStateImpl) then,
  ) = __$$ProgramStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ProgramSheet? currentProgram,
    int? currentWeekNumber,
    int? currentDayNumber,
    bool isLoadingScreen,
    bool isLoadingWeeks,
  });

  @override
  $ProgramSheetCopyWith<$Res>? get currentProgram;
}

/// @nodoc
class __$$ProgramStateImplCopyWithImpl<$Res>
    extends _$ProgramStateCopyWithImpl<$Res, _$ProgramStateImpl>
    implements _$$ProgramStateImplCopyWith<$Res> {
  __$$ProgramStateImplCopyWithImpl(
    _$ProgramStateImpl _value,
    $Res Function(_$ProgramStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProgramState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentProgram = freezed,
    Object? currentWeekNumber = freezed,
    Object? currentDayNumber = freezed,
    Object? isLoadingScreen = null,
    Object? isLoadingWeeks = null,
  }) {
    return _then(
      _$ProgramStateImpl(
        currentProgram: freezed == currentProgram
            ? _value.currentProgram
            : currentProgram // ignore: cast_nullable_to_non_nullable
                  as ProgramSheet?,
        currentWeekNumber: freezed == currentWeekNumber
            ? _value.currentWeekNumber
            : currentWeekNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        currentDayNumber: freezed == currentDayNumber
            ? _value.currentDayNumber
            : currentDayNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        isLoadingScreen: null == isLoadingScreen
            ? _value.isLoadingScreen
            : isLoadingScreen // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLoadingWeeks: null == isLoadingWeeks
            ? _value.isLoadingWeeks
            : isLoadingWeeks // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$ProgramStateImpl implements _ProgramState {
  const _$ProgramStateImpl({
    this.currentProgram = null,
    this.currentWeekNumber = null,
    this.currentDayNumber = null,
    this.isLoadingScreen = false,
    this.isLoadingWeeks = false,
  });

  @override
  @JsonKey()
  final ProgramSheet? currentProgram;
  @override
  @JsonKey()
  final int? currentWeekNumber;
  @override
  @JsonKey()
  final int? currentDayNumber;
  @override
  @JsonKey()
  final bool isLoadingScreen;
  @override
  @JsonKey()
  final bool isLoadingWeeks;

  @override
  String toString() {
    return 'ProgramState(currentProgram: $currentProgram, currentWeekNumber: $currentWeekNumber, currentDayNumber: $currentDayNumber, isLoadingScreen: $isLoadingScreen, isLoadingWeeks: $isLoadingWeeks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramStateImpl &&
            (identical(other.currentProgram, currentProgram) ||
                other.currentProgram == currentProgram) &&
            (identical(other.currentWeekNumber, currentWeekNumber) ||
                other.currentWeekNumber == currentWeekNumber) &&
            (identical(other.currentDayNumber, currentDayNumber) ||
                other.currentDayNumber == currentDayNumber) &&
            (identical(other.isLoadingScreen, isLoadingScreen) ||
                other.isLoadingScreen == isLoadingScreen) &&
            (identical(other.isLoadingWeeks, isLoadingWeeks) ||
                other.isLoadingWeeks == isLoadingWeeks));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentProgram,
    currentWeekNumber,
    currentDayNumber,
    isLoadingScreen,
    isLoadingWeeks,
  );

  /// Create a copy of ProgramState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramStateImplCopyWith<_$ProgramStateImpl> get copyWith =>
      __$$ProgramStateImplCopyWithImpl<_$ProgramStateImpl>(this, _$identity);
}

abstract class _ProgramState implements ProgramState {
  const factory _ProgramState({
    final ProgramSheet? currentProgram,
    final int? currentWeekNumber,
    final int? currentDayNumber,
    final bool isLoadingScreen,
    final bool isLoadingWeeks,
  }) = _$ProgramStateImpl;

  @override
  ProgramSheet? get currentProgram;
  @override
  int? get currentWeekNumber;
  @override
  int? get currentDayNumber;
  @override
  bool get isLoadingScreen;
  @override
  bool get isLoadingWeeks;

  /// Create a copy of ProgramState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgramStateImplCopyWith<_$ProgramStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
