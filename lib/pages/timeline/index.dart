import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

  get _buildLarge => HookConsumer(builder: (context, ref, _) {
        final state = ref.watch(timelineProvider);
        final viewModel = ref.watch(timelineProvider.notifier);
        final controller = useTextEditingController();

        return Row(
          children: [
            if (state.loading) Expanded(child: _buildProgress),
            if (!state.loading)
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  child: state.timelines.isEmpty
                      ? Column(
                          children: [
                            const Text('Messages empty.'),
                            const SizedBox(height: 24.0),
                            TextButton(onPressed: viewModel.init, child: const Text('Reload')),
                          ],
                        )
                      : ListView(
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
                        controller: controller,
                        maxLines: 10,
                        maxLength: state.maxLength,
                        decoration: InputDecoration(
                          hintText: 'Hello crypto!!',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                        )),
                    const SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          onPressed: () => viewModel.postMessage(controller.text),
                          child: const Text('Post')),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      });

  get _buildProgress => const Center(child: CircularProgressIndicator());
}
