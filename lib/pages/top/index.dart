import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPage extends StatelessWidget {
  static const String routeName = '/';

  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          Align(
            alignment: Alignment.center,
            child: OutlinedButton(
              onPressed: () {},
              child: Text('Connect Wallet', style: GoogleFonts.oswald()),
            ),
          )
        ],
      ),
    );
  }
}
