import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklySpendingChart extends StatelessWidget {
  const WeeklySpendingChart({super.key});

  @override
  Widget build(BuildContext context) {
    const selectedIndex = 2; // Mon
    const gradient1 = LinearGradient(
      colors: [Color(0xFFCA8BF4), Color(0xFF8467E9)],
    );
    const gradient2 = LinearGradient(
      colors: [Color(0xFFFEA9C5), Color(0xFFFAA9E0)],
    );

    final spots1 = [
      FlSpot(0, 3),
      FlSpot(1, 4),
      FlSpot(2, 2.5),
      FlSpot(3, 3.5),
      FlSpot(4, 2),
      FlSpot(5, 3),
      FlSpot(6, 2.2),
    ];

    final spots2 = [
      FlSpot(0, 2),
      FlSpot(1, 2.5),
      FlSpot(2, 3),
      FlSpot(3, 2.2),
      FlSpot(4, 3.5),
      FlSpot(5, 2),
      FlSpot(6, 3),
    ];

    return AspectRatio(
      aspectRatio: 1.6,
      child: Stack(
        alignment: Alignment.center,
        children: [
          LineChart(
            LineChartData(
              lineTouchData: LineTouchData(enabled: false),
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 24,
                    getTitlesWidget: (value, _) {
                      const days = [
                        'Sat',
                        'Sun',
                        'Mon',
                        'Tue',
                        'Wed',
                        'Thu',
                        'Fri',
                      ];
                      final index = value.toInt();

                      // Ensure only exact indexes get labels and stay within bounds
                      if (value != index.toDouble() ||
                          index < 0 ||
                          index >= days.length) {
                        return const SizedBox.shrink();
                      }

                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          days[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withValues(alpha: 0.6),
                            fontWeight:
                                index == selectedIndex
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              minX: 0,
              maxX: 6,
              minY: 0,
              maxY: 5,
              lineBarsData: [
                LineChartBarData(
                  spots: spots1,
                  isCurved: true,
                  gradient: gradient1,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: FlDotData(show: false),
                ),
                LineChartBarData(
                  spots: spots2,
                  isCurved: true,
                  gradient: gradient2,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: FlDotData(show: false),
                ),
              ],
            ),
          ),

          // Highlight bar
          Positioned.fill(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final chartWidth = constraints.maxWidth;
                final barWidth = chartWidth / 7;
                final xPos = barWidth * selectedIndex;

                return Stack(
                  children: [
                    Positioned(
                      left: xPos,
                      top: 0,
                      bottom: 24,
                      child: Container(
                        width: barWidth,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDFDAFA).withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    // Dot and label
                    Positioned(
                      left: xPos + barWidth / 2 - 4,
                      top: constraints.maxHeight * 0.4,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Text(
                              '+250',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
