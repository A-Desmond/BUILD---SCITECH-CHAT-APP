import 'package:chat_app/screens/chat_card.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BST-TTP Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: StreamBuilder(
          stream: null,
          builder: (context, snapshot) {
          return ListView.builder(itemBuilder: (context, index) {
            return const ChatCard(isMyMessage: true, message: 'Hello');
          });
        }),
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: const TextField()),
            Expanded(
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.send_sharp)))
          ],
        ),
      ),
    );
  }
}
