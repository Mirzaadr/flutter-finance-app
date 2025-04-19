import 'dart:ui';

import 'package:finance_app/core/utils/currency_format.dart';
import 'package:finance_app/core/utils/date_format.dart';
import 'package:finance_app/views/home/widgets/credit_card_item.dart';
import 'package:finance_app/views/home/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './home_view_model.dart';
import '../../services/home_services.dart';
import '../../models/home/transaction_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double blurValue = 10;
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<double> blurNotifier = ValueNotifier<double>(10.0);
  final ValueNotifier<double> opacityNotifier = ValueNotifier<double>(0.3);

  final HomeViewModel viewModel = HomeViewModel(MockHomeRepository());

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final extent =
          _scrollController.offset /
          _scrollController.position.maxScrollExtent *
          2.0;
      final calculatedBlur = lerpDouble(10, 0, extent)!;
      final calculatedOpacity = lerpDouble(0.3, 1.0, extent)!;

      if ((calculatedBlur - blurNotifier.value).abs() > 0.5) {
        blurNotifier.value = calculatedBlur;
      }

      if ((calculatedOpacity - opacityNotifier.value).abs() > 0.02) {
        opacityNotifier.value = calculatedOpacity;
      }
    });

    viewModel.loadData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    blurNotifier.dispose();
    opacityNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back,",
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "Tawfikul Emon",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.dashboard_customize),
            onPressed: () {},
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (context, _) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
                  _buildCardSection(
                    viewModel.totalBalance,
                    viewModel.currentDate,
                  ),
              const SizedBox(height: 16),
            ],
          ),
              ValueListenableBuilder<double>(
                valueListenable: blurNotifier,
                builder: (context, blurValue, _) {
                  return CustomScrollView(
                    controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(height: 350), // Space for AppBar + Card
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _StickyHeaderDelegate(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: blurValue,
                          sigmaY: blurValue,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                                  color: Colors.white.withValues(
                                    alpha: opacityNotifier.value,
                                  ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Transactions',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: blurValue,
                        sigmaY: blurValue,
                      ),
                      child: Container(
                              color: Colors.white.withValues(
                                alpha: opacityNotifier.value,
                              ),
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.sizeOf(context).height - 210,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                                itemCount: viewModel.transactions.length,
                          itemBuilder:
                                    (context, index) => _buildTransactionItem(
                                      index,
                                      viewModel.transactions,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCardSection(double totalBalance, DateTime currentDate) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Text(
            "Your Balance Is",
            style: TextStyle(color: Colors.purpleAccent, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            "\$ ${formatCurrency(totalBalance)}",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text("Today ${formatDate(currentDate)}"),
          const SizedBox(height: 20),
          Stack(
            clipBehavior: Clip.none,
            children: [
              CreditCardItem(),
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: CreditCardItem(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8ec5fc), Color(0xFFe0c3fc)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  leftText: "M a s t e r",
                  rightText: "USD",
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }

  Widget _buildTransactionItem(int index, List<Transaction> transactions) {
    final item = transactions[index];

    return TransactionItem(
      logo: Icons.apple,
      title: item.title,
      amount: item.amount,
      date: formatDateMDY(item.date),
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
