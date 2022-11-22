import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starpass_sample/app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

/// アプリ起動
void main() {
  // パスに#が入るのを防ぐ
  usePathUrlStrategy();

  // 指定のWidgetを起動
  runApp(const ProviderScope(child: StarPassApp()));
}
