import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deal_app/pages/model/massage.dart';
import 'package:flutter/material.dart';

class ChatServices extends ChangeNotifier {
  var firestore = FirebaseFirestore.instance;

//   //send massage
//   Future<void> sendMessege(String receiveId, String message) {
//     final String currentUserEmail = 'example1@gmail.com';
//     final Timestamp timestamp = Timestamp.now();

//     Message newMessage = Message(senderId: senderId, senderEmail: senderEmail, receiverId: receiverId, message: message, timestap: timestap)
//   }
}
