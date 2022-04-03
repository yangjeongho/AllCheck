import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.message, this.isMe, this.image, {Key? key})
      : super(key: key);
  final String message;
  final bool isMe;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          child: CircleAvatar(
            child : Image.asset(isMe ? 'assets/images/man.png':image,
                                  height: 30,
                                ),
            radius: 18,
            backgroundColor: Colors.grey[600],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: isMe ? Colors.grey[300] : Colors.orangeAccent,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
              bottomLeft: isMe ? Radius.circular(12) : Radius.circular(0),
            ),
          ),
          width: 145,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(message,
              style: TextStyle(color: isMe ? Colors.black : Colors.white)),
        ),
      ],
    );
  }
}
