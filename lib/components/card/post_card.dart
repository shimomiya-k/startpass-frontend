import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starpass_sample/pages/timeline/provider.dart';

final favoriteProvider = FutureProviderFamily<int, String>((ref, id) async {
  final timeline = ref.watch(timelineProvider.notifier);
  return await timeline.getFavoriteCount(id);
});

class PostCard extends ConsumerWidget {
  const PostCard({
    super.key,
    required this.id,
    required this.message,
    required this.address,
    required this.postedAt,
  });

  final String id;
  final String message;
  final String address;
  final int postedAt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(postedAt * 1000).toUtc();
    final state = ref.watch(timelineProvider);
    final notifier = ref.watch(timelineProvider.notifier);
    AsyncValue<int> favorite = ref.watch(favoriteProvider(id));
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 16.0, left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(address, style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: 8.0),
            Text(message),
            const SizedBox(height: 8.0),
            Row(
              children: [
                if (state.updatingFavoriteId == null || state.updatingFavoriteId != id)
                  IconButton(
                    onPressed: () async {
                      await notifier.updateFavorite(id);
                      favorite = ref.refresh(favoriteProvider(id));
                    },
                    icon: Icon(
                      notifier.isFavorite(id)
                          ? Icons.thumb_up_alt
                          : Icons.thumb_up_off_alt_outlined,
                      size: 16.0,
                    ),
                  ),
                if (state.updatingFavoriteId == id)
                  const SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (!favorite.isLoading || favorite.hasValue) Text('${favorite.value ?? 0}'),
                const Spacer(),
                Text('$dateTime', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
