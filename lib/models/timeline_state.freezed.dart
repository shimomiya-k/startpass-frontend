// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timeline_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimelineState _$TimelineStateFromJson(Map<String, dynamic> json) {
  return _TimelineState.fromJson(json);
}

/// @nodoc
mixin _$TimelineState {
  List<Timeline> get timelines => throw _privateConstructorUsedError;
  List<String> get favorites => throw _privateConstructorUsedError;
  int get maxLength => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  dynamic get sortType => throw _privateConstructorUsedError;
  String? get updatingFavoriteId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimelineStateCopyWith<TimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineStateCopyWith<$Res> {
  factory $TimelineStateCopyWith(
          TimelineState value, $Res Function(TimelineState) then) =
      _$TimelineStateCopyWithImpl<$Res, TimelineState>;
  @useResult
  $Res call(
      {List<Timeline> timelines,
      List<String> favorites,
      int maxLength,
      bool loading,
      dynamic sortType,
      String? updatingFavoriteId});
}

/// @nodoc
class _$TimelineStateCopyWithImpl<$Res, $Val extends TimelineState>
    implements $TimelineStateCopyWith<$Res> {
  _$TimelineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timelines = null,
    Object? favorites = null,
    Object? maxLength = null,
    Object? loading = null,
    Object? sortType = null,
    Object? updatingFavoriteId = freezed,
  }) {
    return _then(_value.copyWith(
      timelines: null == timelines
          ? _value.timelines
          : timelines // ignore: cast_nullable_to_non_nullable
              as List<Timeline>,
      favorites: null == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<String>,
      maxLength: null == maxLength
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      sortType: null == sortType
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatingFavoriteId: freezed == updatingFavoriteId
          ? _value.updatingFavoriteId
          : updatingFavoriteId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimelineStateCopyWith<$Res>
    implements $TimelineStateCopyWith<$Res> {
  factory _$$_TimelineStateCopyWith(
          _$_TimelineState value, $Res Function(_$_TimelineState) then) =
      __$$_TimelineStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Timeline> timelines,
      List<String> favorites,
      int maxLength,
      bool loading,
      dynamic sortType,
      String? updatingFavoriteId});
}

/// @nodoc
class __$$_TimelineStateCopyWithImpl<$Res>
    extends _$TimelineStateCopyWithImpl<$Res, _$_TimelineState>
    implements _$$_TimelineStateCopyWith<$Res> {
  __$$_TimelineStateCopyWithImpl(
      _$_TimelineState _value, $Res Function(_$_TimelineState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timelines = null,
    Object? favorites = null,
    Object? maxLength = null,
    Object? loading = null,
    Object? sortType = null,
    Object? updatingFavoriteId = freezed,
  }) {
    return _then(_$_TimelineState(
      timelines: null == timelines
          ? _value._timelines
          : timelines // ignore: cast_nullable_to_non_nullable
              as List<Timeline>,
      favorites: null == favorites
          ? _value._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<String>,
      maxLength: null == maxLength
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      sortType: null == sortType ? _value.sortType : sortType,
      updatingFavoriteId: freezed == updatingFavoriteId
          ? _value.updatingFavoriteId
          : updatingFavoriteId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimelineState extends _TimelineState with DiagnosticableTreeMixin {
  const _$_TimelineState(
      {final List<Timeline> timelines = const [],
      final List<String> favorites = const [],
      this.maxLength = 1,
      this.loading = true,
      this.sortType = SortType.postedAtAsc,
      this.updatingFavoriteId})
      : _timelines = timelines,
        _favorites = favorites,
        super._();

  factory _$_TimelineState.fromJson(Map<String, dynamic> json) =>
      _$$_TimelineStateFromJson(json);

  final List<Timeline> _timelines;
  @override
  @JsonKey()
  List<Timeline> get timelines {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timelines);
  }

  final List<String> _favorites;
  @override
  @JsonKey()
  List<String> get favorites {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  @override
  @JsonKey()
  final int maxLength;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final dynamic sortType;
  @override
  final String? updatingFavoriteId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimelineState(timelines: $timelines, favorites: $favorites, maxLength: $maxLength, loading: $loading, sortType: $sortType, updatingFavoriteId: $updatingFavoriteId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimelineState'))
      ..add(DiagnosticsProperty('timelines', timelines))
      ..add(DiagnosticsProperty('favorites', favorites))
      ..add(DiagnosticsProperty('maxLength', maxLength))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('sortType', sortType))
      ..add(DiagnosticsProperty('updatingFavoriteId', updatingFavoriteId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimelineState &&
            const DeepCollectionEquality()
                .equals(other._timelines, _timelines) &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites) &&
            (identical(other.maxLength, maxLength) ||
                other.maxLength == maxLength) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other.sortType, sortType) &&
            (identical(other.updatingFavoriteId, updatingFavoriteId) ||
                other.updatingFavoriteId == updatingFavoriteId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_timelines),
      const DeepCollectionEquality().hash(_favorites),
      maxLength,
      loading,
      const DeepCollectionEquality().hash(sortType),
      updatingFavoriteId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimelineStateCopyWith<_$_TimelineState> get copyWith =>
      __$$_TimelineStateCopyWithImpl<_$_TimelineState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimelineStateToJson(
      this,
    );
  }
}

abstract class _TimelineState extends TimelineState {
  const factory _TimelineState(
      {final List<Timeline> timelines,
      final List<String> favorites,
      final int maxLength,
      final bool loading,
      final dynamic sortType,
      final String? updatingFavoriteId}) = _$_TimelineState;
  const _TimelineState._() : super._();

  factory _TimelineState.fromJson(Map<String, dynamic> json) =
      _$_TimelineState.fromJson;

  @override
  List<Timeline> get timelines;
  @override
  List<String> get favorites;
  @override
  int get maxLength;
  @override
  bool get loading;
  @override
  dynamic get sortType;
  @override
  String? get updatingFavoriteId;
  @override
  @JsonKey(ignore: true)
  _$$_TimelineStateCopyWith<_$_TimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}
