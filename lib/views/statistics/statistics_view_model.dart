import 'package:flutter/foundation.dart';
import '../../models/statistics/history_model.dart';
import '../../services/statistics_services.dart';

class StatisticsViewModel extends ChangeNotifier {
  final MockStatisticsRepository _repository;

  StatisticsViewModel(this._repository);

  List<History> _history = [];
  double _totalSpending = 0;
  DateTime _selectedMonth = DateTime.now();
  bool _isLoading = false;

  List<History> get history => _history;
  double get totalSpending => _totalSpending;
  DateTime get selectedMonth => _selectedMonth;
  bool get isLoading => _isLoading;

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    _totalSpending = await _repository.fetchTotalSpending();
    _history = await _repository.fetchHistory();

    _isLoading = false;
    notifyListeners();
  }

  void setMonth(DateTime newMonth) {
    _selectedMonth = newMonth;
    notifyListeners();
    // In a real app: filter or reload data based on selected month
  }
}
