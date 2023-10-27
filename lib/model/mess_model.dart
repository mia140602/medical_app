class Message {
  final String id;
  final String content;
  final DateTime timestamp;
  final String chatId;
  final String senderId;
  final String receiverId;
  final bool isCurrentUser; 

  Message({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.chatId,
    required this.senderId,
    required this.receiverId,
     this.isCurrentUser= false,
  });
  Message.fromJson(Map<String, dynamic> json)
      : id = json['id']??'',
        content = json['content']??'',
        timestamp = DateTime.parse(json['timestamp']),
        chatId = json['chatId']??'',
        senderId = json['sender']['_id'] ?? '', 
        receiverId = json['receiver']['_id'] ?? '',
        isCurrentUser = false; 
  Message copyWith({bool? isCurrentUser}) {
    return Message(
      id: this.id,
      content: this.content,
      timestamp: this.timestamp,
      chatId: this.chatId,
      senderId: this.senderId,
      receiverId: this.receiverId,
      isCurrentUser: isCurrentUser ?? this.isCurrentUser,
    );
  }
}

