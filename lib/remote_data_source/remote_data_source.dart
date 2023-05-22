import 'package:chat_app/core/failure.dart';
import 'package:chat_app/core/typedef.dart';
import 'package:chat_app/model/message_model.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class RemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late SharedPreferences preferences;

  FutureEither<void> register({required String name}) async {
    preferences = await SharedPreferences.getInstance();
    String id = const Uuid().v1();
    User user = User(id: id, name: name, isOnline: false);
    try {
      await _firestore.collection('users').doc(user.id).set(user.toMap());
      preferences.setString('id', user.id);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<void> sendMessage({required String text}) async {
    preferences = await SharedPreferences.getInstance();
    try {
      String? id = preferences.getString('id');
      final userInfo = await _firestore.collection('users').doc(id).get();
      User user = User.fromMap(userInfo.data()!);
      Message message = Message(
          name: user.name, senderId: user.id, text: text, time: DateTime.now());
      await _firestore.collection('chat').add(message.toMap());
      await MyNotification().sendNotification(title: user.name, body: text);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<List<Message>> getChat() {
    final chats = _firestore
        .collection('chat')
        .orderBy('time', descending: true)
        .snapshots();
    final message = chats.map((chat) =>
        chat.docs.map((data) => Message.fromMap(data.data())).toList());
    return message;
  }

  Future<String?> authCheck()async{
    preferences = await SharedPreferences.getInstance();
    return preferences.getString('id');
  }
}
