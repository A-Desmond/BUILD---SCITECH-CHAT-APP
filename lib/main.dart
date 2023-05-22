import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/bloc/register/register_bloc.dart';
import 'package:chat_app/remote_data_source/remote_data_source.dart';
import 'package:chat_app/screens/auth_checker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

Future<void> _firebaseBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  RegisterBloc(remoteDataSource: RemoteDataSource())
                    ..add(const CheckAuthEvent())),
          BlocProvider(create: (context) => ChatCubit()),
        ],
        child: MaterialApp(
          title: 'Chat',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const AuthChecker(),
        ));
  }
}
