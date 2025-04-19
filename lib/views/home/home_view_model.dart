import 'package:flutter/foundation.dart';
import '../../models/home/transaction_model.dart';
import '../../models/home/credit_card_model.dart';
import '../../services/home_services.dart';

class HomeViewModel extends ChangeNotifier {
  final MockHomeRepository _repository;

  HomeViewModel(this._repository);

  double _totalBalance = 0;
  List<Transaction> _transactions = [];
  List<CreditCard> _creditCards = [];
  DateTime _currentDate = DateTime.now();

  double get totalBalance => _totalBalance;
  List<Transaction> get transactions => _transactions;
  List<CreditCard> get creditCards => _creditCards;
  DateTime get currentDate => _currentDate;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    _totalBalance = await _repository.fetchTotalBalance();
    _transactions = await _repository.fetchTransactions();
    _creditCards = await _repository.fetchCreditCards();

    _isLoading = false;
    notifyListeners();
  }
}
