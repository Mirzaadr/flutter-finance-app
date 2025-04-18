import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double blurValue = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
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
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              _buildCardSection(),
              const SizedBox(height: 16),
            ],
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              // if (notification.metrics.axis == Axis.vertical) {
              //   final offset = notification.metrics.pixels;
              //   setState(() {
              //     blurValue =
              //         offset <= 0 ? 10 : (10 - (offset / 10)).clamp(0, 10);
              //   });
              // }
              // print(notification.metrics.pixels);
              return true;
            },
            child: CustomScrollView(
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
                            color: Colors.white.withValues(alpha: 0.7),
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
                        color: Colors.white.withValues(alpha: 0.7),
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.sizeOf(context).height - 210,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder:
                              (context, index) => _buildTransactionItem(index),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Text(
            "Your Balance Is",
            style: TextStyle(color: Colors.purpleAccent),
          ),
          const SizedBox(height: 8),
          const Text(
            "\$ 45,934.00",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text("Today 14 Sep 2022"),
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 16 / 10,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Color(0xFF232526), Color(0xFF414345)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 16,
                    top: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "L i f e  S t y l e",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 16,
                    top: 16,
                    child: const Text(
                      "EURO",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  // Center(
                  //   child: Container(
                  //     width: 120,
                  //     height: 60,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(40),
                  //       gradient: const LinearGradient(
                  //         colors: [Color(0xFFe0c3fc), Color(0xFF8ec5fc)],
                  //         begin: Alignment.topLeft,
                  //         end: Alignment.bottomRight,
                  //       ),
                  //     ),
                  //     child: const Center(
                  //       child: Text(
                  //         "USD",
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(int index) {
    final items = [
      {'title': 'Netflix', 'amount': '-\$126.00'},
      {'title': 'Apple', 'amount': '-\$170.00'},
      {'title': 'Instagram', 'amount': '-\$46.00'},
    ];
    final item = items[index % items.length];

    return ListTile(
      leading: const CircleAvatar(backgroundColor: Colors.grey),
      title: Text(item['title']!),
      subtitle: const Text('Sep 12, 2022  •  09:31 AM'),
      trailing: Text(
        item['amount']!,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
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
