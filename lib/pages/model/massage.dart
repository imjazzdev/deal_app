class Message {
  final String senderId, senderEmail, receiverId, message, timestap;

  Message(
      {required this.senderId,
      required this.senderEmail,
      required this.receiverId,
      required this.message,
      required this.timestap});

  // Map<String, dynamic> toMap() {
  //   return {
  //     'senderId' : senderId,
  //     'senderEmail' : senderEmail,
  //     'receiverId' : receiverId,
  //     'message' : message,
  //     'timestap' : timestap
  //   }
  // }
}
