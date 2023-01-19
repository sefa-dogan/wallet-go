import 'dart:convert';

class Transaction {
  final String? id;
  final String transactionDate;
  final String fromAccountId;
  final String toAccountId;
  final String walletId;
  final double amount;
  Transaction({
    this.id,
    required this.transactionDate,
    required this.fromAccountId,
    required this.toAccountId,
    required this.walletId,
    required this.amount,
  });

  Transaction copyWith({
    String? id,
    String? transactionDate,
    String? fromAccountId,
    String? toAccountId,
    String? walletId,
    double? amount,
  }) {
    return Transaction(
      id: id ?? this.id,
      transactionDate: transactionDate ?? this.transactionDate,
      fromAccountId: fromAccountId ?? this.fromAccountId,
      toAccountId: toAccountId ?? this.toAccountId,
      walletId: walletId ?? this.walletId,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'transactionDate': transactionDate,
      'fromAccountId': fromAccountId,
      'toAccountId': toAccountId,
      'walletId': walletId,
      'amount': amount,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'] != null ? map['id'] as String : null,
      transactionDate: map['transactionDate'] as String,
      fromAccountId: map['fromAccountId'] as String,
      toAccountId: map['toAccountId'] as String,
      walletId: map['walletId'] as String,
      amount: map['amount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) => Transaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Transaction(id: $id, transactionDate: $transactionDate, fromAccountId: $fromAccountId, toAccountId: $toAccountId, walletId: $walletId, amount: $amount)';
  }

  @override
  bool operator ==(covariant Transaction other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.transactionDate == transactionDate &&
      other.fromAccountId == fromAccountId &&
      other.toAccountId == toAccountId &&
      other.walletId == walletId &&
      other.amount == amount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      transactionDate.hashCode ^
      fromAccountId.hashCode ^
      toAccountId.hashCode ^
      walletId.hashCode ^
      amount.hashCode;
  }
}

/* // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Transaction {
  final String id;
  final DateTime transactionDate;
  final String fromAccountId;
  final String toAccountId;
  final double amount;
  Transaction({
    required this.id,
    required this.transactionDate,
    required this.fromAccountId,
    required this.toAccountId,
    required this.amount,
  });

  Transaction copyWith({
    String? id,
    DateTime? transactionDate,
    String? fromAccountId,
    String? toAccountId,
    double? amount,
  }) {
    return Transaction(
      id: id ?? this.id,
      transactionDate: transactionDate ?? this.transactionDate,
      fromAccountId: fromAccountId ?? this.fromAccountId,
      toAccountId: toAccountId ?? this.toAccountId,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'transactionDate': transactionDate.millisecondsSinceEpoch,
      'fromAccountId': fromAccountId,
      'toAccountId': toAccountId,
      'amount': amount,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'] as String,
      transactionDate: DateTime.parse(map['transactionDate'] as String) ,
      fromAccountId: map['fromAccountId'] as String,
      toAccountId: map['toAccountId'] as String,
      amount: double.tryParse(map['amount'].runtimeType == int
              ? "${map['amount']}.00"
              : map['amount'].toString()) ??
          0.00,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Transaction(id: $id, transactionDate: $transactionDate, fromAccountId: $fromAccountId, toAccountId: $toAccountId, amount: $amount)';
  }

  @override
  bool operator ==(covariant Transaction other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.transactionDate == transactionDate &&
        other.fromAccountId == fromAccountId &&
        other.toAccountId == toAccountId &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        transactionDate.hashCode ^
        fromAccountId.hashCode ^
        toAccountId.hashCode ^
        amount.hashCode;
  }
}
 */