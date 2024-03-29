import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import './screens/food_list_screen.dart';
import './screens/food_detail_screen.dart';
import './screens/food_edit_screen.dart';

class FoodRoutes {
  static const String namespace = "/food";
  static final shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "Food Shell");

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (context, state) => const FoodListScreen(),
      ),
      GoRoute(
        path: "$namespace/:uuid",
        builder: (context, state) =>
            FoodDetailScreen(uuid: state.pathParameters['uuid']!),
      ),
      GoRoute(
        path: "$namespace/edit/:uuid",
        builder: (context, state) =>
            FoodEditScreen(uuid: state.pathParameters['uuid']!),
      ),
    ],
  );
}
