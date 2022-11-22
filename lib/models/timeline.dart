// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline.freezed.dart';
part 'timeline.g.dart';

/// Timelineモデル
@freezed
class Timeline with _$Timeline {
  const Timeline._();

  const factory Timeline({
    required String id,
    required String address,
    required String message,
    @Default(0) int favorites,
    required int postedAt,
  }) = _Timeline;

  factory Timeline.fromJson(Map<String, dynamic> json) => _$TimelineFromJson(json);
}
