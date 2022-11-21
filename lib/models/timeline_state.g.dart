// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimelineState _$$_TimelineStateFromJson(Map<String, dynamic> json) =>
    _$_TimelineState(
      timelines: (json['timelines'] as List<dynamic>?)
              ?.map((e) => Timeline.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      maxLength: json['maxLength'] as int? ?? 1,
      loading: json['loading'] as bool? ?? true,
    );

Map<String, dynamic> _$$_TimelineStateToJson(_$_TimelineState instance) =>
    <String, dynamic>{
      'timelines': instance.timelines,
      'maxLength': instance.maxLength,
      'loading': instance.loading,
    };
