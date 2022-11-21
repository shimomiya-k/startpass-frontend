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
  int get maxLength => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

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
  $Res call({List<Timeline> timelines, int maxLength, bool loading});
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
    Object? maxLength = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      timelines: null == timelines
          ? _value.timelines
          : timelines // ignore: cast_nullable_to_non_nullable
              as List<Timeline>,
      maxLength: null == maxLength
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call({List<Timeline> timelines, int maxLength, bool loading});
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
    Object? maxLength = null,
    Object? loading = null,
  }) {
    return _then(_$_TimelineState(
      timelines: null == timelines
          ? _value._timelines
          : timelines // ignore: cast_nullable_to_non_nullable
              as List<Timeline>,
      maxLength: null == maxLength
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimelineState extends _TimelineState with DiagnosticableTreeMixin {
  const _$_TimelineState(
      {final List<Timeline> timelines = const [],
      this.maxLength = 1,
      this.loading = true})
      : _timelines = timelines,
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

  @override
  @JsonKey()
  final int maxLength;
  @override
  @JsonKey()
  final bool loading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimelineState(timelines: $timelines, maxLength: $maxLength, loading: $loading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimelineState'))
      ..add(DiagnosticsProperty('timelines', timelines))
      ..add(DiagnosticsProperty('maxLength', maxLength))
      ..add(DiagnosticsProperty('loading', loading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimelineState &&
            const DeepCollectionEquality()
                .equals(other._timelines, _timelines) &&
            (identical(other.maxLength, maxLength) ||
                other.maxLength == maxLength) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_timelines), maxLength, loading);

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
      final int maxLength,
      final bool loading}) = _$_TimelineState;
  const _TimelineState._() : super._();

  factory _TimelineState.fromJson(Map<String, dynamic> json) =
      _$_TimelineState.fromJson;

  @override
  List<Timeline> get timelines;
  @override
  int get maxLength;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$_TimelineStateCopyWith<_$_TimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}
