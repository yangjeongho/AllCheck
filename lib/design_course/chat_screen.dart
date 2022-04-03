import 'package:all_check/design_course/chat/newMessage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../navigation_home_screen.dart';
import 'chat/message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('우리말로하자'),
          actions: [
            IconButton(
              onPressed: () {
                _authentication.signOut();
                //Navigator.pop(context);
                NavigationHomeScreen();
              },
              icon: const Icon(
                Icons.exit_to_app_sharp,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: const [
              Expanded(child: Messages()),
              NewMessage(),
            ],
          ),
        ));
  }
}
