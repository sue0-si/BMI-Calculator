import 'dart:convert';

import 'package:bmi_calculator/bmi_calculator/provider.dart';
import 'package:bmi_calculator/bmi_calculator/result_screen.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'main_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) {
        var height = Provider.of<ValueProvider>(context).getHeight();
        var weight = Provider.of<ValueProvider>(context).getWeight();

        return ResultScreen(height: double.parse(height), weight: double.parse(weight));
      },
    ),
  ],
);