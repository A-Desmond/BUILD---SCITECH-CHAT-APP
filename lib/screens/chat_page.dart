import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/screens/chat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final messageController = TextEditingController();
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
              stream: BlocProvider.of<ChatCubit>(context).getChat(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final message = snapshot.data![index];
                      return ChatCard(
                          isMyMessage: message.senderId == '',
                          message: message);
                    });
              })),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: const TextField()),
            Expanded(
                child: IconButton(
                    onPressed: () => BlocProvider.of<ChatCubit>(context)
                        .sendMessage(messageController.text),
                    icon: const Icon(Icons.send_sharp)))
          ],
        ),
      ),
    );
  }
}
