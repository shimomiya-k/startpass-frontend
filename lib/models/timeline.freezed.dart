// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timeline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Timeline _$TimelineFromJson(Map<String, dynamic> json) {
  return _Timeline.fromJson(json);
}

/// @nodoc
mixin _$Timeline {
  String get id => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get postedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimelineCopyWith<Timeline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineCopyWith<$Res> {
  factory $TimelineCopyWith(Timeline value, $Res Function(Timeline) then) =
      _$TimelineCopyWithImpl<$Res, Timeline>;
  @useResult
  $Res call({String id, String address, String message, int postedAt});
}

/// @nodoc
class _$TimelineCopyWithImpl<$Res, $Val extends Timeline>
    implements $TimelineCopyWith<$Res> {
  _$TimelineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
    Object? message = null,
    Object? postedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      postedAt: null == postedAt
          ? _value.postedAt
          : postedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimelineCopyWith<$Res> implements $TimelineCopyWith<$Res> {
  factory _$$_TimelineCopyWith(
          _$_Timeline value, $Res Function(_$_Timeline) then) =
      __$$_TimelineCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String address, String message, int postedAt});
}

/// @nodoc
class __$$_TimelineCopyWithImpl<$Res>
    extends _$TimelineCopyWithImpl<$Res, _$_Timeline>
    implements _$$_TimelineCopyWith<$Res> {
  __$$_TimelineCopyWithImpl(
      _$_Timeline _value, $Res Function(_$_Timeline) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
    Object? message = null,
    Object? postedAt = null,
  }) {
    return _then(_$_Timeline(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      postedAt: null == postedAt
          ? _value.postedAt
          : postedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Timeline extends _Timeline with DiagnosticableTreeMixin {
  const _$_Timeline(
      {required this.id,
      required this.address,
      required this.message,
      required this.postedAt})
      : super._();

  factory _$_Timeline.fromJson(Map<String, dynamic> json) =>
      _$$_TimelineFromJson(json);

  @override
  final String id;
  @override
  final String address;
  @override
  final String message;
  @override
  final int postedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Timeline(id: $id, address: $address, message: $message, postedAt: $postedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Timeline'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('postedAt', postedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Timeline &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.postedAt, postedAt) ||
                other.postedAt == postedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, address, message, postedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimelineCopyWith<_$_Timeline> get copyWith =>
      __$$_TimelineCopyWithImpl<_$_Timeline>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimelineToJson(
      this,
    );
  }
}

abstract class _Timeline extends Timeline {
  const factory _Timeline(
      {required final String id,
      required final String address,
      required final String message,
      required final int postedAt}) = _$_Timeline;
  const _Timeline._() : super._();

  factory _Timeline.fromJson(Map<String, dynamic> json) = _$_Timeline.fromJson;

  @override
  String get id;
  @override
  String get address;
  @override
  String get message;
  @override
  int get postedAt;
  @override
  @JsonKey(ignore: true)
  _$$_TimelineCopyWith<_$_Timeline> get copyWith =>
      throw _privateConstructorUsedError;
}
