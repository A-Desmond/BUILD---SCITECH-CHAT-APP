import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/remote_data_source/remote_data_source.dart';
import 'package:chat_app/screens/chat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../notification.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late String ? userId;
  getId()async{
userId =  await RemoteDataSource().authCheck();
  }
  @override
  void initState() {
    super.initState();
    MyNotification().initPushNotification();
    
  }

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
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('No Messages yet'),
                    );
                  }
                  if (snapshot.data == null) {
                    return const Center(
                      child: Text('No Messages yet'),
                    );
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final message = snapshot.data![index];
                        return ChatCard(
                          message: message,
                          isMyMessage: message.senderId ==
                             userId,
                        );
                      });
                })),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: SizedBox(
              height: 50,
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      suffix: IconButton(
                        onPressed: () {
                          BlocProvider.of<ChatCubit>(context)
                              .sendMessage(messageController.text);
                          messageController.clear();
                        },
                        icon: const Icon(Icons.send_sharp,
                            color: Colors.green, size: 18),
                      ),
                    )),
              )),
        ));
  }
}
