import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starpass_sample/providers/ethereum.dart';

/// 未ログイン時に表示するTOP画面
class TopPage extends ConsumerWidget {
  static const String routeName = '/';

  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ethereumNotifier = ref.watch(ethereumProvider.notifier);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Welcome Social Network on Web3🌟',
              style: GoogleFonts.oswald(
                  fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize),
            ),
          ),
          const SizedBox(height: 16.0),

          // 接続されていなければ、Connectできるボタンを表示する
          if (!ethereumNotifier.isConnected)
            Align(
              alignment: Alignment.center,
              child: OutlinedButton(
                onPressed: ethereumNotifier.requestAccount,
                child: Text('Connect Wallet', style: GoogleFonts.oswald()),
              ),
            )
        ],
      ),
    );
  }
}
