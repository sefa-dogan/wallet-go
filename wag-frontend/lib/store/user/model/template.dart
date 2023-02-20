// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Template {
  final String id;
  final double amount;
  final String accountId;
  final String walletId;
  Template({
    required this.id,
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
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'accountId': accountId,
      'walletId': walletId,
    };
  }

  factory Template.fromMap(Map<String, dynamic> map) {
    var data = Template(
      id: map['id'] as String,
      amount: map['amount'].runtimeType == int
          ? double.tryParse("${map['amount']}.0")
          : map['amount'],
      accountId: map['accountId'] as String,
      walletId: map['walletId'] as String,
    );
    return data;
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
