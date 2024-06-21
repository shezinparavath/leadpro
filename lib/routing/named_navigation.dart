import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leadpro/constant/routes.dart';
import 'package:leadpro/view/dashboard.dart';
import 'package:leadpro/view/follow_up_screen.dart';
import 'package:leadpro/view/login_screen.dart';
import 'package:leadpro/view/mainscreen.dart';
import 'package:leadpro/view/resume_lead.dart';
import 'package:leadpro/view/salesman_booking_screen.dart';

class NamedNavigation {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: AppRoutes.login,
      routes: [
        GoRoute(
            path: AppRoutes.login,
            builder: (context, state) => const LoginScreen()),
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) => Mainscreen(child: child),
            routes: [
              GoRoute(
                  path: AppRoutes.dashboard,
                  parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) => const Dashboard()),
              GoRoute(
                  path: AppRoutes.salesmanBooking,
                  parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) => const SalesmanBookingScreen()),
              GoRoute(
                  path: AppRoutes.followUp,
                  parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) => const FollowUpScreen())
            ]),
        GoRoute(
            path: AppRoutes.resumeLead,
            builder: (context, state) => const ResumeLead())
      ]);
}
