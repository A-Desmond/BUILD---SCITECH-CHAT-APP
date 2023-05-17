import 'package:chat_app/core/enum.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register/register_bloc.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      if (state is AuthState) {
        switch (state.authEnum) {
          case AuthEnum.authenticated:
            return const ChatPage();
          case AuthEnum.unAuthenticated:
            return const RegisterPage();
          default:
        }
      } else {
        return const Center(
          child: Text('Something went wrong, Please restart the app'),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    }));
  }
}
