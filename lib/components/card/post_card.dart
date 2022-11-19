import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.message, required this.address, required this.postedAt});

  final String message;
  final String address;
  final int postedAt;

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(postedAt * 1000).toUtc();
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
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up_off_alt_outlined, size: 16.0)),
                const Text('1111'),
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
