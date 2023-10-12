import 'package:deal_app/pages/chatroom_detail.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),

      // body: ListView.builder(
      //   itemBuilder: (context, index) => ListTile(
      //     leading: Image.asset('assets/img/car.png'),
      //     title: Text(
      //       'Penjual',
      //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //     ),
      //     subtitle: Text('Aku mau beli'),
      //     onTap: () {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => ChatroomDetail(),
      //           ));
      //     },
      //   ),
      // ),
    );
  }
}
