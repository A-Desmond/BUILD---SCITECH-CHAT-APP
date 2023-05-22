import 'package:chat_app/bloc/register/register_bloc.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Welcome to BST-TTP Flutter',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: InputBorder.none,
                  hintText: 'Name',
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              print(state);
              if (state is RegisterSuccess) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ChatPage()));
              } else if (state is RegisterFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              if (state is RegisterLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      maximumSize: const Size(250, 80),
                      minimumSize: const Size(150, 50)),
                  onPressed: () => BlocProvider.of<RegisterBloc>(context)
                      .add(RegisterUserEvent(nameController.text)),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ));
            },
          )
        ],
      ),
    );
  }
}
