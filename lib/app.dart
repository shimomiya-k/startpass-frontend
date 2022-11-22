import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starpass_sample/providers/ethereum.dart';
import 'package:starpass_sample/providers/router.dart';
import 'package:starpass_sample/utils/no_transition_builder.dart';

class StarPassApp extends ConsumerWidget {
  const StarPassApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Routerを読み込む
    final router = ref.watch(routerProvider);
    // Etherの状態を監視し、Routerでリダイレクトするか確認する
    ref.listen(ethereumProvider, (previous, next) {
      router.refresh();
    });

    return MaterialApp.router(
      title: 'Social Network',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          // 画面遷移をアプリみたいにしない(スライドさせない)
          for (final platform in TargetPlatform.values) platform: const NoTransitionsBuilder(),
        }),
      ),
      routerConfig: router,
    );
  }
}
