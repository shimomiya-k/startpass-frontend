import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starpass_sample/pages/top/index.dart';

final routeProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(path: TopPage.routeName, builder: (context, state) => const TopPage()),
    ],
  );
});
