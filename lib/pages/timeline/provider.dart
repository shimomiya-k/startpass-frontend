import 'dart:js';

import 'package:flutter_web3/flutter_web3.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starpass_sample/models/timeline.dart';
import 'package:starpass_sample/models/timeline_state.dart';
import 'package:starpass_sample/providers/ethereum.dart';

final timelineProvider = StateNotifierProvider<TimelineProvider, TimelineState>(
  (ref) => TimelineProvider(ref),
);

class TimelineProvider extends StateNotifier<TimelineState> {
  TimelineProvider(this._ref) : super(const TimelineState()) {
    getAllMessages();
  }

  final Ref _ref;

  void getAllMessages() async {
    final ethereum = _ref.read(ethereumProvider);
    final contract = ethereum.contract!;
    final result = await contract.call<List<dynamic>>('getAllMessages');
    final timelines = result.map((item) {
      return Timeline.fromJson(
        {
          'id': item[0] as String,
          'address': item[1] as String,
          'message': item[2] as String,
          'postedAt': int.parse(item[3].toString()),
        },
      );
    }).toList();

    state = state.copyWith(timelines: timelines);
  }

  void getMaxLength() async {
    final ethereum = _ref.read(ethereumProvider);
    final contract = ethereum.contract!;
    final maxLength = await contract.call<BigInt>('maxLength');
  }
}
