
class User {
  final String id;
  final String name;
  final bool isOnline;
  User({
    required this.id,
    required this.name,
    required this.isOnline,
  });

  User copyWith({
    String? id,
    String? name,
    bool? isOnline,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'isOnline': isOnline,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      isOnline: map['isOnline'] as bool,
    );
  }

  @override
  String toString() => 'User(id: $id, name: $name, isOnline: $isOnline)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.isOnline == isOnline;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ isOnline.hashCode;
}
