import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Provider等でcontext(画面遷移など)が使えるようにするためのProvider
final navigatorKeyProvider = Provider((_) => GlobalKey<NavigatorState>());

extension NavigatorStateEx on NavigatorState {
  BuildContext get descendantContext => overlay!.context;
}
