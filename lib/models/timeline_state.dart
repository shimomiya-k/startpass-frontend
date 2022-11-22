// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starpass_sample/models/timeline.dart';

part 'timeline_state.freezed.dart';
part 'timeline_state.g.dart';

enum SortType {
  postedAtAsc,
  postedAtDesc,
  favoriteAsc,
  favoriteDesc,
}

@freezed
class TimelineState with _$TimelineState {
  const TimelineState._();

  const factory TimelineState({
    @Default([]) List<Timeline> timelines,
    @Default([]) List<String> favorites,
    @Default(1) int maxLength,
    @Default(true) bool loading,
    @Default(SortType.postedAtDesc) sortType,
    String? updatingFavoriteId,
  }) = _TimelineState;

  factory TimelineState.fromJson(Map<String, dynamic> json) => _$TimelineStateFromJson(json);
}
