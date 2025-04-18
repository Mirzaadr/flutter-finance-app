import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StatisticsScreen extends StatelessWidget {
  StatisticsScreen({super.key});
  final List<Map<String, dynamic>> transactions = [
    {
      'icon': Icons.shopping_cart,
      'title': 'Shopping',
      'amount': '-\$126.00',
      'date': 'Sep 12, 2022',
      'time': '09:31 AM',
    },
    {
      'icon': Icons.favorite,
      'title': 'Health',
      'amount': '-\$170.00',
      'date': 'Sep 22, 2022',
      'time': '09:31 AM',
    },
    // {
    //   'icon': Icons.fastfood,
    //   'title': 'Food',
    //   'amount': '-\$46.00',
    //   'date': 'Sep 18, 2022',
    //   'time': '09:31 AM',
    // },
    // {
    //   'icon': Icons.fastfood,
    //   'title': 'Food',
    //   'amount': '-\$46.00',
    //   'date': 'Sep 18, 2022',
    //   'time': '09:31 AM',
    // },
    // {
    //   'icon': Icons.fastfood,
    //   'title': 'Food',
    //   'amount': '-\$46.00',
    //   'date': 'Sep 18, 2022',
    //   'time': '09:31 AM',
    // },
    // {
    //   'icon': Icons.fastfood,
    //   'title': 'Food',
    //   'amount': '-\$46.00',
    //   'date': 'Sep 18, 2022',
    //   'time': '09:31 AM',
    // },
    // {
    //   'icon': Icons.fastfood,
    //   'title': 'Food',
    //   'amount': '-\$46.00',
    //   'date': 'Sep 18, 2022',
    //   'time': '09:31 AM',
    // },
    // {
    //   'icon': Icons.fastfood,
    //   'title': 'Food',
    //   'amount': '-\$46.00',
    //   'date': 'Sep 18, 2022',
    //   'time': '09:31 AM',
    // },
    // {
    //   'icon': Icons.fastfood,
    //   'title': 'Food',
    //   'amount': '-\$46.00',
    //   'date': 'Sep 18, 2022',
    //   'time': '09:31 AM',
    // },
    // {
    //   'icon': Icons.fastfood,
    //   'title': 'Food',
    //   'amount': '-\$46.00',
    //   'date': 'Sep 18, 2022',
    //   'time': '09:31 AM',
    // },
    // {
    //   'icon': Icons.fastfood,
    //   'title': 'Food',
    //   'amount': '-\$46.00',
    //   'date': 'Sep 18, 2022',
    //   'time': '09:31 AM',
    // },
    // {
    //   'icon': Icons.fastfood,
    //   'title': 'Food',
    //   'amount': '-\$46.00',
    //   'date': 'Sep 18, 2022',
    //   'time': '09:32 AM',
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Text(
                        'Your Balance Is',
                        style: TextStyle(color: Colors.purple, fontSize: 14),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$ 45,934.00',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: CustomPaint(
                      painter: GraphPainter(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:
                            [
                              'Sat',
                              'Sun',
                              'Mon',
                              'Tue',
                              'Wed',
                            ].map((day) => Text(day)).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyHeaderDelegate(
              child: Container(
                color: const Color(0xFFF8F8F8),
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
                    Icon(Icons.more_horiz),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final tx = transactions[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Icon(tx['icon'], color: Colors.black),
                ),
                title: Text(
                  tx['title'],
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('${tx['date']}  •  ${tx['time']}'),
                trailing: Text(
                  tx['amount'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              );
            }, childCount: transactions.length),
          ),
        ],
      ),
    );
  }
}

class GraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.purple.withOpacity(0.4)
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    final path = Path();
    final points = [
      Offset(0, size.height * 0.6),
      Offset(size.width * 0.25, size.height * 0.4),
      Offset(size.width * 0.5, size.height * 0.6),
      Offset(size.width * 0.75, size.height * 0.3),
      Offset(size.width, size.height * 0.5),
    ];

    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
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
