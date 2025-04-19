import 'package:finance_app/core/utils/currency_format.dart';
import 'package:finance_app/models/statistics/history_model.dart';
import 'package:finance_app/services/statistics_services.dart';
import 'package:finance_app/views/statistics/widgets/chart.dart';
import 'package:finance_app/views/statistics/statistics_view_model.dart';
import 'package:finance_app/views/statistics/widgets/history_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  final StatisticsViewModel viewModel = StatisticsViewModel(
    MockStatisticsRepository(),
  );

  @override
  void initState() {
    super.initState();
    viewModel.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 60,
        title: Text(
          'Statistics',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => context.goNamed('home'),
        ),
        actions: [
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (context, _) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
                child: Container(
                  height: 350,
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Text(
                              'Your Balance Is',
                              style: TextStyle(
                                color: Colors.purpleAccent,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '\$ ${formatCurrency(viewModel.totalSpending)}',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      WeeklySpendingChart(),
                    ],
                  ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyHeaderDelegate(
              child: Container(
                    color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'History',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                        PopupMenuButton(
                          icon: Icon(Icons.more_horiz),
                          initialValue: "Latest",
                          itemBuilder:
                              (BuildContext context) => <PopupMenuEntry>[
                                const PopupMenuItem(
                                  value: 'Latest',
                                  child: Text('Latest'),
                                ),
                                const PopupMenuItem(
                                  value: 'Earliest',
                                  child: Text('Earliest'),
                                ),
                              ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.sizeOf(context).height - 210,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: viewModel.history.length,
                    itemBuilder:
                        (context, index) =>
                            _buildTransactionItem(index, viewModel.history),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTransactionItem(int index, List<History> histories) {
    final item = histories[index];

    return HistoryItem(
      logo: item.icon ?? Icons.monetization_on,
      title: item.title,
      amount: item.amount,
      date: item.date,
    );
  }
}
class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyHeaderDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
