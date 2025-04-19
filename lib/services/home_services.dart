import '../models/home/transaction_model.dart';
import '../models/home/credit_card_model.dart';

class MockHomeRepository {
  final List<Transaction> items = [
    Transaction(
      id: 'txn_1',
      title: 'Netflix',
      amount: 126.00,
      date: DateTime.now().subtract(Duration(days: 20)),
    ),
    Transaction(
      id: 'txn_2',
      title: 'Spotify',
      amount: 10.00,
      date: DateTime.now().subtract(Duration(days: 20)),
    ),
    Transaction(
      id: 'txn_3',
      title: 'Google',
      amount: 50.00,
      date: DateTime.now().subtract(Duration(days: 20)),
    ),
    Transaction(
      id: 'txn_4',
      title: 'Amazon',
      amount: 200.00,
      date: DateTime.now().subtract(Duration(days: 20)),
    ),
    Transaction(
      id: 'txn_5',
      title: 'Facebook',
      amount: 30.00,
      date: DateTime.now().subtract(Duration(days: 20)),
    ),
    Transaction(
      id: 'txn_6',
      title: 'Twitter',
      amount: 20.00,
      date: DateTime.now().subtract(Duration(days: 20)),
    ),
    Transaction(
      id: 'txn_7',
      title: 'Snapchat',
      amount: 15.00,
      date: DateTime.now().subtract(Duration(days: 20)),
    ),
    Transaction(
      id: 'txn_8',
      title: 'YouTube',
      amount: 25.00,
      date: DateTime.now().subtract(Duration(days: 20)),
    ),
    Transaction(
      id: 'txn_9',
      title: 'LinkedIn',
      amount: 40.00,
      date: DateTime.now().subtract(Duration(days: 20)),
    ),
    Transaction(
      id: 'txn_10',
      title: 'Pinterest',
      amount: 5.00,
      date: DateTime.now().subtract(Duration(days: 20)),
    ),
    Transaction(
      id: 'txn_12',
      title: 'WhatsApp',
      amount: 8.00,
      date: DateTime.now().subtract(Duration(days: 20)),
    ),
    Transaction(
      id: 'txn_13',
      title: 'Apple',
      amount: 170.00,
      date: DateTime.now().subtract(Duration(days: 20)),
    ),
    Transaction(
      id: 'txn_14',
      title: 'Instagram',
      amount: 46.00,
      date: DateTime.now().subtract(Duration(days: 20)),
    ),
  ];

  Future<List<Transaction>> fetchTransactions() async {
    await Future.delayed(const Duration(milliseconds: 500)); // simulate latency
    // return List.generate(10, (index) {
    //   return Transaction(
    //     id: 'txn_$index',
    //     title: 'Payment #$index',
    //     amount: (10 + index) * 3.14,
    //     date: DateTime.now().subtract(Duration(days: index)),
    //   );
    // });
    return items;
  }

  Future<List<CreditCard>> fetchCreditCards() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      CreditCard(
        id: 'cc1',
        cardNumber: '**** **** **** 1234',
        holderName: 'John Doe',
        balance: 1250.50,
        brand: 'Visa',
      ),
      CreditCard(
        id: 'cc2',
        cardNumber: '**** **** **** 5678',
        holderName: 'John Doe',
        balance: 800.00,
        brand: 'Mastercard',
      ),
    ];
  }

  Future<double> fetchTotalBalance() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return 45934.50;
  }
}
