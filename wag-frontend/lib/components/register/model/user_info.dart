// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserInfo {
  final String? id;
  final String appUserId;
  final String name;
  final String surname;
  final String tcno;
  final String email;
  UserInfo({
    this.id,
    required this.appUserId,
    required this.name,
    required this.surname,
    required this.tcno,
    required this.email,
  });

  UserInfo copyWith({
    String? id,
    String? appUserId,
    String? name,
    String? surname,
    String? tcno,
    String? email,
  }) {
    return UserInfo(
      id: id ?? this.id,
      appUserId: appUserId ?? this.appUserId,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      tcno: tcno ?? this.tcno,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'appUserId': appUserId,
      'name': name,
      'surname': surname,
      'tcno': tcno,
      'email': email,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      id: map['id'] != null ? map['id'] as String : null,
      appUserId: map['appUserId'] as String,
      name: map['name'] as String,
      surname: map['surname'] as String,
      tcno: map['tcno'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) => UserInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserInfo(id: $id, appUserId: $appUserId, name: $name, surname: $surname, tcno: $tcno, email: $email)';
  }

  @override
  bool operator ==(covariant UserInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.appUserId == appUserId &&
      other.name == name &&
      other.surname == surname &&
      other.tcno == tcno &&
      other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      appUserId.hashCode ^
      name.hashCode ^
      surname.hashCode ^
      tcno.hashCode ^
      email.hashCode;
  }
}
