// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Wallet {
  final String id;
  final String userInfoId;
  final String name;
  final double balance;
  Wallet({
    required this.id,
    required this.userInfoId,
    required this.name,
    required this.balance,
  });

  Wallet copyWith({
    String? id,
    String? userInfoId,
    String? name,
    double? balance,
  }) {
    return Wallet(
      id: id ?? this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      name: name ?? this.name,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userInfoId': userInfoId,
      'name': name,
      'balance': balance,
    };
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      id: map['id'] as String,
      userInfoId: map['userInfoId'] as String,
      name: map['name'] as String,
      balance: double.tryParse(map['balance'].runtimeType == int
              ? "${map['balance']}.00"
              : map['balance'].toString()) ??
          0.00,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallet.fromJson(String source) =>
      Wallet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Wallet(id: $id, userInfoId: $userInfoId, name: $name, balance: $balance)';
  }

  @override
  bool operator ==(covariant Wallet other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userInfoId == userInfoId &&
        other.name == name &&
        other.balance == balance;
  }

  @override
  int get hashCode {
    return id.hashCode ^ userInfoId.hashCode ^ name.hashCode ^ balance.hashCode;
  }
}
