// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Template {
  final String? id;
  final double amount;
  final String accountId;
  final String walletId;
  Template({
    this.id,
    required this.amount,
    required this.accountId,
    required this.walletId,
  });

  Template copyWith({
    String? id,
    double? amount,
    String? accountId,
    String? walletId,
  }) {
    return Template(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      accountId: accountId ?? this.accountId,
      walletId: walletId ?? this.walletId,
    );
  }

  Map<String, dynamic> toMap() {
    var data = <String, dynamic>{
      'id': id,
      'amount': amount,
      'accountId': accountId,
      'walletId': walletId,
    };
    return data;
  }

  factory Template.fromMap(Map<String, dynamic> map) {
    return Template(
      id: map['id'] != null ? map['id'] as String : null,
      amount: map['amount'] as double,
      accountId: map['accountId'] as String,
      walletId: map['walletId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Template.fromJson(String source) =>
      Template.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Template(id: $id, amount: $amount, accountId: $accountId, walletId: $walletId)';
  }

  @override
  bool operator ==(covariant Template other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.amount == amount &&
        other.accountId == accountId &&
        other.walletId == walletId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        amount.hashCode ^
        accountId.hashCode ^
        walletId.hashCode;
  }
}
