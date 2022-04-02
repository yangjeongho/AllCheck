import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final RegExp _regExp = RegExp(r'[\uac00-\ud7af]', unicode: true);
  final _coltroller = TextEditingController();
  var _userEntrMessage = '';

  void _sendMessgae(){
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('chat').add({
      'text': _userEntrMessage,
      'time': Timestamp.now(),
      'userId':user!.uid,
    });
    _coltroller.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: null,
              controller: _coltroller,
              decoration: InputDecoration(labelText: 'Send Message...'),
              onChanged: (value) {
                setState(() {
                  _userEntrMessage = value;
                });
              },
            ),
          ),
          IconButton(
              onPressed: _userEntrMessage.trim().isEmpty ? null : _sendMessgae,
              icon: const Icon(Icons.send),
              color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
