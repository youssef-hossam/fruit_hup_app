class UserEntity {
  final String uid;
  final String name;
  final String email;
  UserEntity({
    required this.uid,
    required this.name,
    required this.email,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': uid,
      'name': name,
      'email': email,
    };
  }
}
