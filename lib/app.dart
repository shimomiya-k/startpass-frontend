import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starpass_sample/providers/router.dart';

class StarPassApp extends ConsumerWidget {
  const StarPassApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);

    return MaterialApp.router(
      title: 'Social Network',
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.blue),
      routerConfig: router,
    );
  }
}
