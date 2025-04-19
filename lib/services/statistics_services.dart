import '../models/statistics/history_model.dart';
import 'package:flutter/material.dart';

class MockStatisticsRepository {
  final List<History> histories = [
    History(
      id: 'hst_1',
      icon: Icons.shopping_cart,
      title: 'Shopping',
      amount: 126.00,
      date: DateTime.now().subtract(Duration(days: 30)),
      // 'time': '09:31 AM',
    ),
    History(
      id: 'hst_1',
      icon: Icons.favorite,
      title: 'Health',
      amount: 170.00,
      date: DateTime.now().subtract(Duration(days: 30)),
      // 'time': '09:31 AM',
    ),
    History(
      id: 'hst_1',
      icon: Icons.fastfood,
      title: 'Food',
      amount: 46.00,
      date: DateTime.now().subtract(Duration(days: 30)),
      // 'time': '09:31 AM',
    ),
    History(
      id: 'hst_1',
      icon: Icons.fastfood,
      title: 'Food',
      amount: 46.00,
      date: DateTime.now().subtract(Duration(days: 30)),
      // 'time': '09:31 AM',
    ),
    History(
      id: 'hst_1',
      icon: Icons.fastfood,
      title: 'Food',
      amount: 46.00,
      date: DateTime.now().subtract(Duration(days: 30)),
      // 'time': '09:31 AM',
    ),
    History(
      id: 'hst_1',
      icon: Icons.fastfood,
      title: 'Food',
      amount: 46.00,
      date: DateTime.now().subtract(Duration(days: 30)),
      // 'time': '09:31 AM',
    ),
    History(
      id: 'hst_1',
      icon: Icons.fastfood,
      title: 'Food',
      amount: 46.00,
      date: DateTime.now().subtract(Duration(days: 30)),
      // 'time': '09:31 AM',
    ),
    History(
      id: 'hst_1',
      icon: Icons.fastfood,
      title: 'Food',
      amount: 46.00,
      date: DateTime.now().subtract(Duration(days: 30)),
      // 'time': '09:31 AM',
    ),
    History(
      id: 'hst_1',
      icon: Icons.fastfood,
      title: 'Food',
      amount: 46.00,
      date: DateTime.now().subtract(Duration(days: 30)),
      // 'time': '09:31 AM',
    ),
    History(
      id: 'hst_1',
      icon: Icons.fastfood,
      title: 'Food',
      amount: 46.00,
      date: DateTime.now().subtract(Duration(days: 30)),
      // 'time': '09:31 AM',
    ),
    History(
      id: 'hst_1',
      icon: Icons.fastfood,
      title: 'Food',
      amount: 46.00,
      date: DateTime.now().subtract(Duration(days: 30)),
      // 'time': '09:31 AM',
    ),
    History(
      id: 'hst_1',
      icon: Icons.fastfood,
      title: 'Food',
      amount: 46.00,
      date: DateTime.now().subtract(Duration(days: 30)),
      // 'time': '09:32 AM',
    ),
  ];

  Future<List<History>> fetchHistory() async {
    await Future.delayed(const Duration(milliseconds: 400));
    // return List.generate(10, (index) {
    //   return History(
    //     id: 'hist_$index',
    //     title: 'Spent on Category #$index',
    //     amount: (index + 1) * 12.5,
    //     date: DateTime.now().subtract(Duration(days: index * 3)),
    //   );
    // });
    return histories;
  }

  Future<double> fetchTotalSpending() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return 45934.50;
  }
}
