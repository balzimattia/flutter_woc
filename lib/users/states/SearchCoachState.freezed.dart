// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SearchCoachState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchCoachState {
  String get search => throw _privateConstructorUsedError;
  List<UserModel> get coachesList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of SearchCoachState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchCoachStateCopyWith<SearchCoachState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCoachStateCopyWith<$Res> {
  factory $SearchCoachStateCopyWith(
    SearchCoachState value,
    $Res Function(SearchCoachState) then,
  ) = _$SearchCoachStateCopyWithImpl<$Res, SearchCoachState>;
  @useResult
  $Res call({
    String search,
    List<UserModel> coachesList,
    bool isLoading,
    String? errorMessage,
  });
}

/// @nodoc
class _$SearchCoachStateCopyWithImpl<$Res, $Val extends SearchCoachState>
    implements $SearchCoachStateCopyWith<$Res> {
  _$SearchCoachStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchCoachState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
    Object? coachesList = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            search: null == search
                ? _value.search
                : search // ignore: cast_nullable_to_non_nullable
                      as String,
            coachesList: null == coachesList
                ? _value.coachesList
                : coachesList // ignore: cast_nullable_to_non_nullable
                      as List<UserModel>,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchCoachStateImplCopyWith<$Res>
    implements $SearchCoachStateCopyWith<$Res> {
  factory _$$SearchCoachStateImplCopyWith(
    _$SearchCoachStateImpl value,
    $Res Function(_$SearchCoachStateImpl) then,
  ) = __$$SearchCoachStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String search,
    List<UserModel> coachesList,
    bool isLoading,
    String? errorMessage,
  });
}

/// @nodoc
class __$$SearchCoachStateImplCopyWithImpl<$Res>
    extends _$SearchCoachStateCopyWithImpl<$Res, _$SearchCoachStateImpl>
    implements _$$SearchCoachStateImplCopyWith<$Res> {
  __$$SearchCoachStateImplCopyWithImpl(
    _$SearchCoachStateImpl _value,
    $Res Function(_$SearchCoachStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchCoachState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
    Object? coachesList = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$SearchCoachStateImpl(
        search: null == search
            ? _value.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String,
        coachesList: null == coachesList
            ? _value._coachesList
            : coachesList // ignore: cast_nullable_to_non_nullable
                  as List<UserModel>,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SearchCoachStateImpl implements _SearchCoachState {
  const _$SearchCoachStateImpl({
    this.search = '',
    final List<UserModel> coachesList = const [],
    this.isLoading = false,
    this.errorMessage = null,
  }) : _coachesList = coachesList;

  @override
  @JsonKey()
  final String search;
  final List<UserModel> _coachesList;
  @override
  @JsonKey()
  List<UserModel> get coachesList {
    if (_coachesList is EqualUnmodifiableListView) return _coachesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coachesList);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString() {
    return 'SearchCoachState(search: $search, coachesList: $coachesList, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchCoachStateImpl &&
            (identical(other.search, search) || other.search == search) &&
            const DeepCollectionEquality().equals(
              other._coachesList,
              _coachesList,
            ) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    search,
    const DeepCollectionEquality().hash(_coachesList),
    isLoading,
    errorMessage,
  );

  /// Create a copy of SearchCoachState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCoachStateImplCopyWith<_$SearchCoachStateImpl> get copyWith =>
      __$$SearchCoachStateImplCopyWithImpl<_$SearchCoachStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SearchCoachState implements SearchCoachState {
  const factory _SearchCoachState({
    final String search,
    final List<UserModel> coachesList,
    final bool isLoading,
    final String? errorMessage,
  }) = _$SearchCoachStateImpl;

  @override
  String get search;
  @override
  List<UserModel> get coachesList;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;

  /// Create a copy of SearchCoachState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchCoachStateImplCopyWith<_$SearchCoachStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
