import 'package:finance_app/routes/main_navigation_shell.dart';
import 'package:finance_app/views/home/home_screen.dart';
import 'package:finance_app/views/onboarding/onboarding_screen.dart';
import 'package:finance_app/views/settings/settings_screen.dart';
import 'package:finance_app/views/statistics/statistics_screen.dart';
import 'package:finance_app/views/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _key = GlobalKey<NavigatorState>();

GoRouter appRouter() {
  return GoRouter(
    navigatorKey: _key,
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const OnboardingScreen()),
      StatefulShellRoute.indexedStack(
        builder:
            (context, state, navigationShell) =>
                MainNavigationShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: HomeScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/statistics',
                name: 'statistics',
                pageBuilder:
                    (context, state) =>
                        NoTransitionPage(child: StatisticsScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/transactions',
                name: 'transactions',
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: WalletScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: SettingsScreen()),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
