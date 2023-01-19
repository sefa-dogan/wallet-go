// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SuccessPayment {
  final String appAccountName;
  final String walletName;
  final double amount;
  final String transactionDate;
  SuccessPayment({
    required this.appAccountName,
    required this.walletName,
    required this.amount,
    required this.transactionDate,
  });

  SuccessPayment copyWith({
    String? appAccountName,
    String? walletName,
    double? amount,
    String? transactionDate,
  }) {
    return SuccessPayment(
      appAccountName: appAccountName ?? this.appAccountName,
      walletName: walletName ?? this.walletName,
      amount: amount ?? this.amount,
      transactionDate: transactionDate ?? this.transactionDate,
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      'appAccountName': appAccountName,
      'walletName': walletName,
      'amount': amount.toString(),
      'transactionDate': transactionDate.toString(),
    };
  }

  factory SuccessPayment.fromMap(Map<String, dynamic> map) {
    return SuccessPayment(
      appAccountName: map['appAccountName'] as String,
      walletName: map['walletName'] as String,
      amount: map['amount'] as double,
      transactionDate: (map['transactionDate'] as DateTime).toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory SuccessPayment.fromJson(String source) => SuccessPayment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SuccessPayment(appAccountName: $appAccountName, walletName: $walletName, amount: $amount, transactionDate: $transactionDate)';
  }

  @override
  bool operator ==(covariant SuccessPayment other) {
    if (identical(this, other)) return true;
  
    return 
      other.appAccountName == appAccountName &&
      other.walletName == walletName &&
      other.amount == amount &&
      other.transactionDate == transactionDate;
  }

  @override
  int get hashCode {
    return appAccountName.hashCode ^
      walletName.hashCode ^
      amount.hashCode ^
      transactionDate.hashCode;
  }
}


/*// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SuccessPayment {
  final String appAccountName;
  final String walletName;
  final String amount;
  final String transactionDate;
  SuccessPayment({
    required this.appAccountName,
    required this.walletName,
    required this.amount,
    required this.transactionDate,
  });

  SuccessPayment copyWith({
    String? appAccountName,
    String? walletName,
    String? amount,
    String? transactionDate,
  }) {
    return SuccessPayment(
      appAccountName: appAccountName ?? this.appAccountName,
      walletName: walletName ?? this.walletName,
      amount: amount ?? this.amount,
      transactionDate: transactionDate ?? this.transactionDate,
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      'appAccountName': appAccountName,
      'walletName': walletName,
      'amount': amount,
      'transactionDate': transactionDate,
    };
  }

  factory SuccessPayment.fromMap(Map<String, dynamic> map) {
    return SuccessPayment(
      appAccountName: map['appAccountName'] as String,
      walletName: map['walletName'] as String,
      amount: map['amount'] as String,
      transactionDate: map['transactionDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SuccessPayment.fromJson(String source) =>
      SuccessPayment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SuccessPayment(appAccountName: $appAccountName, walletName: $walletName, amount: $amount, transactionDate: $transactionDate)';
  }

  @override
  bool operator ==(covariant SuccessPayment other) {
    if (identical(this, other)) return true;

    return other.appAccountName == appAccountName &&
        other.walletName == walletName &&
        other.amount == amount &&
        other.transactionDate == transactionDate;
  }

  @override
  int get hashCode {
    return appAccountName.hashCode ^
        walletName.hashCode ^
        amount.hashCode ^
        transactionDate.hashCode;
  }
}


*/