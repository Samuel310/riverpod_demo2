import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_demo2/screens/pincode_detail_screen.dart';

import 'screens/home_screen.dart';

class AppRoutes {
  AppRoutes._();
  static final instance = AppRoutes._();

  GoRouter generateRoutes(WidgetRef ref) {
    return GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'pincode/:key',
              builder: (BuildContext context, GoRouterState state) {
                return const PincodeDetailScreen();
              },
            ),
          ],
        ),
      ],
    );
  }
}
