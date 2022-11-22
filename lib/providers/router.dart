import 'dart:math';

import 'package:flutter_web3/ethereum.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starpass_sample/pages/timeline/index.dart';
import 'package:starpass_sample/pages/top/index.dart';
import 'package:starpass_sample/providers/ethereum.dart';
import 'package:flutter_web3/ethereum.dart' as ether;
import 'package:starpass_sample/providers/navigator.dart';

/// Router制御
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: ref.watch(navigatorKeyProvider),
    routes: [
      GoRoute(path: TopPage.routeName, builder: (context, state) => const TopPage()),
      GoRoute(path: TimelinePage.routeName, builder: (context, state) => const TimelinePage()),
    ],

    /// リダイレクト処理
    redirect: (context, state) async {
      final ethereum = ref.read(ethereumProvider);
      final ethereumNotifier = ref.read(ethereumProvider.notifier);

      bool isConnected = ethereumNotifier.isConnected;

      // Stateにchainがまだ存在しない場合は、取得してみる
      // エラー未考慮
      if (ether.ethereum != null && ethereum.chainId == null) {
        try {
          final accounts = await ether.ethereum!.getAccounts();
          isConnected = accounts.isNotEmpty;
          Future.delayed(const Duration(seconds: 1)).then((value) {
            ethereumNotifier.getAccounts();
          });
        } catch (e) {
          // Noting
        }
      }

      // URLと接続状態で遷移先の出しわけ

      if (state.subloc == TopPage.routeName && isConnected) {
        return TimelinePage.routeName;
      }

      if (state.subloc != TopPage.routeName && !isConnected) {
        return TopPage.routeName;
      }

      return null;
    },
  );
});
