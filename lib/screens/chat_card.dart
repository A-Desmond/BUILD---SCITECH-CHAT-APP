import 'package:chat_app/model/message_model.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final bool isMyMessage;
  final Message message;
  const ChatCard({super.key, required this.isMyMessage, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              shape: BoxShape.rectangle,
              color: isMyMessage ? Colors.black.withOpacity(0.7) : Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.name,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message.text,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    message.time.toUtc().toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
