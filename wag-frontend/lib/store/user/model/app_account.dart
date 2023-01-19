// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppAccount {
  final String id;
  final String name;
  final double balance;
  final String walletId;
  AppAccount({
    required this.id,
    required this.name,
    required this.balance,
    required this.walletId,
  });

  AppAccount copyWith({
    String? id,
    String? name,
    double? balance,
    String? walletId,
  }) {
    return AppAccount(
      id: id ?? this.id,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      walletId: walletId ?? this.walletId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'balance': balance,
      'walletId': walletId,
    };
  }

  factory AppAccount.fromMap(Map<String, dynamic> map) {
    return AppAccount(
      id: map['id'] as String,
      name: map['name'] as String,
      balance: double.tryParse(map['balance'].runtimeType == int
              ? "${map['balance']}.00"
              : map['balance'].toString()) ??
          0.00,
      walletId: map['walletId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppAccount.fromJson(String source) =>
      AppAccount.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppAccount(id: $id, name: $name, balance: $balance, walletId: $walletId)';
  }

  @override
  bool operator ==(covariant AppAccount other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.balance == balance &&
        other.walletId == walletId;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ balance.hashCode ^ walletId.hashCode;
  }
}
