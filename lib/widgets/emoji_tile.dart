import 'package:flutter/material.dart';

class EmojiTile extends StatelessWidget {
  final String emoji;

  const EmojiTile({super.key, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(emoji, style: const TextStyle(fontSize: 24)),
      onTap: () {
        // print('Selected Emoji: $emoji');
      },
    );
  }
}
