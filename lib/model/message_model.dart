

class Message {
  final String name;
  final String senderId;
  final String text;
  final DateTime time;
  Message({
    required this.name,
    required this.senderId,
    required this.text,
    required this.time,
  });

  Message copyWith({
    String? name,
    String? senderId,
    String? text,
    DateTime? time,
  }) {
    return Message(
      name: name ?? this.name,
      senderId: senderId ?? this.senderId,
      text: text ?? this.text,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'senderId': senderId,
      'text': text,
      'time': time.millisecondsSinceEpoch,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      name: map['name'] as String,
      senderId: map['senderId'] as String,
      text: map['text'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
    );
  }

  @override
  String toString() {
    return 'Message(name: $name, senderId: $senderId, text: $text, time: $time)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.senderId == senderId &&
      other.text == text &&
      other.time == time;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      senderId.hashCode ^
      text.hashCode ^
      time.hashCode;
  }

  
}
