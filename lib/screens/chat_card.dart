import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final bool isMyMessage;
  final String message;
  const ChatCard({super.key, required this.isMyMessage, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      alignment: isMyMessage ? Alignment.topRight :Alignment.topLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
        color: isMyMessage ? Colors.blue : Colors.grey,
      ),
      child: Text(message),
    );
  }
}
