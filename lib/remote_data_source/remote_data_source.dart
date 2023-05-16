import 'package:chat_app/core/failure.dart';
import 'package:chat_app/core/typedef.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteDataSource{
 final  FirebaseFirestore _firestore = FirebaseFirestore.instance;
 late SharedPreferences preferences;
 
 FutureEither<void> register({required User user})async{
  preferences = await SharedPreferences.getInstance();
  try {
    await _firestore.collection('users').doc(user.id).set(user.toMap());
    preferences.setString('id', user.id);
    return right(null);
  } catch (e) {
    return left(Failure(e.toString()));
  }
 }
 

}