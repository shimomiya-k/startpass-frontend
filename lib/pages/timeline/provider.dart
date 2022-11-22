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

  /// 初期化処理
  /// 1. メッセージ全件取得
  /// 2. 最大文字数取得
  /// 3. 自分がいいねしてるId一覧を取得
  void init() async {
    try {
      state = state.copyWith(loading: true);
      await getAllMessages();
      await getMaxLength();
      await getFavorites();
    } catch (e) {
      // Error
      print(e);
    } finally {
      state = state.copyWith(loading: false);
    }
  }

  /// メッセージ全件取得
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

  /// 最大文字数の取得
  /// これはデプロイしたオーナーしか変更不可(polygonscan等で確認)
  Future<void> getMaxLength() async {
    final ethereum = _ref.read(ethereumProvider);
    final contract = ethereum.contract!;
    final maxLength = await contract.call<BigInt>('maxLength');

    state = state.copyWith(maxLength: maxLength.toInt());
  }

  /// 自身がいいねしてるMessageのIdリストを取得
  Future<void> getFavorites() async {
    final ethereum = _ref.read(ethereumProvider);
    final contract = ethereum.contract!;
    final favorites = await contract.call<List>('getAddressToFavorites');

    if (favorites.isEmpty) {
      state = state.copyWith(favorites: []);
      return;
    }

    state = state.copyWith(favorites: favorites.map((e) => e.toString()).toList());
  }

  /// Messageに対してどのくらいいいねがあるのかを取得し、Timelineオブジェクトに反映
  /// それぞれのMessageを表示しているコンポーネントが呼び出す
  Future<int> getFavoriteCount(String id) async {
    final ethereum = _ref.read(ethereumProvider);
    final contract = ethereum.contract!;
    final favoritesCount = await contract.call<List>('getFavoriteCountFromMessage', [id]);
    final count = int.parse(favoritesCount.first.toString());
    final timelines = state.timelines.map((e) {
      if (e.id != id) {
        return e;
      }

      return e.copyWith(favorites: count);
    }).toList();

    sort(timelines);

    state = state.copyWith(timelines: timelines);

    return count;
  }

  /// 投稿
  Future<void> postMessage(String? text) async {
    // 空文字はエラー
    if (text == null || text.isEmpty) {
      final context = _ref.read(navigatorKeyProvider).currentContext!;
      const snackBar = SnackBar(content: Text('Message is empty!!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    // 読み込み中とかはエラー
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

    // 投稿できたらデータ取得し直す
    init();
  }

  /// いいねの更新
  Future<void> updateFavorite(String id) async {
    final ethereum = _ref.read(ethereumProvider);
    final contract = ethereum.contract!;

    state = state.copyWith(updatingFavoriteId: id);

    try {
      await (await contract.send('updateFavorite', [id])).wait();
      const snackBar = SnackBar(content: Text('Updated Favorite!!'));
      if (mounted) {
        final context = _ref.read(navigatorKeyProvider).currentContext!;
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      const snackBar = SnackBar(content: Text('Updated Favorite error!!'));
      final context = _ref.read(navigatorKeyProvider).currentContext!;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      state = state.copyWith(updatingFavoriteId: null);
      return;
    }

    try {
      await getFavorites();
    } catch (e) {
      const snackBar = SnackBar(content: Text('Get Favorites error!!'));
      final context = _ref.read(navigatorKeyProvider).currentContext!;
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } finally {
      state = state.copyWith(updatingFavoriteId: null);
    }
  }

  /// ソートの更新をハンドル
  void updateSort(SortType sortType) {
    state = state.copyWith(sortType: sortType);
    final timelines = List<Timeline>.from(state.timelines);
    sort(timelines);
    state = state.copyWith(timelines: timelines);
  }

  /// Timelineをソート
  void sort(List<Timeline> timelines) {
    switch (state.sortType) {
      case SortType.postedAtAsc:
        timelines.sort((a, b) => a.postedAt.compareTo(b.postedAt));
        break;
      case SortType.postedAtDesc:
        timelines.sort((a, b) => b.postedAt.compareTo(a.postedAt));
        break;
      case SortType.favoriteAsc:
        timelines.sort((a, b) => a.favorites.compareTo(b.favorites));
        break;
      case SortType.favoriteDesc:
        timelines.sort((a, b) => b.favorites.compareTo(a.favorites));
        break;
    }
  }

  /// 対象のIdをいいねしているか
  bool isFavorite(String id) {
    return state.favorites.contains(id);
  }
}
