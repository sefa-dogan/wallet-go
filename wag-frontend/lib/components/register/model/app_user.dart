// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppUser {
  final String? id;
  final String username;
  final String password;
  AppUser({
    this.id,
    required this.username,
    required this.password,
  });

  AppUser copyWith({
    String? id,
    String? username,
    String? password,
  }) {
    return AppUser(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'password': password,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] != null ? map['id'] as String : null,
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AppUser(id: $id, username: $username, password: $password)';

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode => id.hashCode ^ username.hashCode ^ password.hashCode;
}
