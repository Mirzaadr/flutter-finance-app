// lib/widgets/main_navigation_shell.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MainNavigationShell extends StatelessWidget {
  // final Widget child;
  final StatefulNavigationShell navigationShell;

  const MainNavigationShell({super.key, required this.navigationShell});

  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final currentIndex = _locationToIndex(
    //   GoRouterState.of(context).uri.toString(),
    // );

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => _onDestinationSelected(index),
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          selectedFontSize: BorderSide.strokeAlignCenter,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.barChart2),
              label: 'Statistics',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.wallet),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.settings),
              label: 'Profile',
            ),
          ],
        ),
        // child: NavigationBar(
        //   selectedIndex: navigationShell.currentIndex,
        //   labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   destinations: [
        //     // home
        //     NavigationDestination(
        //       icon: const Icon(LucideIcons.home),
        //       label: 'Home',
        //     ),
        //     // profile
        //     NavigationDestination(
        //       icon: const Icon(LucideIcons.barChart2),
        //       label: 'Statistics',
        //     ),
        //     NavigationDestination(
        //       icon: const Icon(LucideIcons.wallet),
        //       label: 'Wallet',
        //     ),
        //     NavigationDestination(
        //       icon: const Icon(LucideIcons.settings),
        //       label: 'Settings',
        //     ),
        //   ],
        //   onDestinationSelected: _onDestinationSelected,
        // ),
      ),
    );
  }
}
