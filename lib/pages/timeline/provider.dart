import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starpass_sample/models/timeline.dart';
import 'package:starpass_sample/models/timeline_state.dart';
import 'package:starpass_sample/providers/ethereum.dart';
import 'package:starpass_sample/providers/navigator.dart';

final timelineProvider = StateNotifierProvider<TimelineProvider, TimelineState>(
  (ref) => TimelineProvider(ref),
);

class TimelineProvider extends StateNotifier<TimelineState> {
  TimelineProvider(this._ref) : super(const TimelineState()) {
    init();
  }

  final Ref _ref;

  void init() async {
    try {
      state = state.copyWith(loading: true);
      await getAllMessages();
      await getMaxLength();
    } catch (e) {
      // Error
      print(e);
    } finally {
      state = state.copyWith(loading: false);
    }
  }

  Future<void> getAllMessages() async {
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

  Future<void> getMaxLength() async {
    final ethereum = _ref.read(ethereumProvider);
    final contract = ethereum.contract!;
    final maxLength = await contract.call<BigInt>('maxLength');

    state = state.copyWith(maxLength: maxLength.toInt());
  }

  Future<void> postMessage(String? text) async {
    if (text == null || text.isEmpty) {
      final context = _ref.read(navigatorKeyProvider).currentContext!;
      const snackBar = SnackBar(content: Text('Message is empty!!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (state.loading) {
      final context = _ref.read(navigatorKeyProvider).currentContext!;
      const snackBar = SnackBar(content: Text('Already Loading!! Please Wait!!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    state = state.copyWith(loading: true);

    final ethereum = _ref.read(ethereumProvider);
    final contract = ethereum.contract!;
    try {
      await (await contract.send('postMessage', [text])).wait();
      const snackBar = SnackBar(content: Text('Post done!!'));
      if (mounted) {
        final context = _ref.read(navigatorKeyProvider).currentContext!;
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      state = state.copyWith(loading: false);
      const snackBar = SnackBar(content: Text('Post error!!'));
      final context = _ref.read(navigatorKeyProvider).currentContext!;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    init();
  }
}
