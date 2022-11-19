import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starpass_sample/components/card/post_card.dart';
import 'package:starpass_sample/pages/timeline/provider.dart';
import 'package:starpass_sample/providers/ethereum.dart';

class TimelinePage extends ConsumerWidget {
  static const String routeName = '/timeline';

  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ethereumProvider);
    final ethereum = ref.watch(ethereumProvider.notifier);

    Widget child = Container();
    if (state.chainId != null) {
      child = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'This service must be connected to Polygon Testnet.',
              style: GoogleFonts.oswald().copyWith(
                fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Align(
            alignment: Alignment.center,
            child: OutlinedButton(
              onPressed: ethereum.switchChain,
              child: Text('Switch Chain', style: GoogleFonts.oswald()),
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Timeline')),
      body: ethereum.isInOperatingChain ? _buildBody : child,
    );
  }

  get _buildBody => LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 750) {
          return _buildLarge;
        } else {
          return const Center(child: Text('small'));
        }
      });

  get _buildLarge => Consumer(builder: (context, ref, _) {
        final state = ref.watch(timelineProvider);
        return Row(
          children: [
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: ListView(
                  padding: const EdgeInsets.all(24.0),
                  children: List.generate(
                    state.timelines.length,
                    (index) => Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: PostCard(
                        message: state.timelines[index].message,
                        address: state.timelines[index].address,
                        postedAt: state.timelines[index].postedAt,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text('Post message!!'),
                    const SizedBox(height: 8.0),
                    TextField(
                        maxLines: 10,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                          hintText: 'Hello crypto!!',
                        )),
                    const SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(onPressed: () {}, child: const Text('Post')),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      });
}
