import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/ui.dart';
import '../screens/screens.dart';
import '../state_managers/app_state_manager.dart';
import '../state_managers/shared_prefs.dart';

class AppRouter {
  final SharedPrefs sharedPrefs;

  AppRouter({required this.sharedPrefs});

  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/generate',
    routes: [
      GoRoute(
        name: 'generate',
        path: '/generate',
        builder: (context, state) => Home(title: UI.title),
      ),
      GoRoute(
        name: 'history',
        path: '/history',
        builder: (context, state) => const History(),
      ),
      GoRoute(
        name: 'favorite',
        path: '/favorite',
        builder: (context, state) => const Favorite(),
      ),
      GoRoute(
        name: 'single_story',
        path: '/single_story/:id',
        builder: (context, state) {
          final itemId = state.params['id'] ?? '';

          return const SingleStory();
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
          key: state.pageKey,
          child: Scaffold(body: Center(child: Text(state.error.toString()))));
    },
  );
  // @override
  // // TODO: implement navigatorKey
  // GlobalKey<NavigatorState>? navigatorKey;
  // // => throw UnimplementedError();

  // AppStateManager? appStateManager;

  // AppRouter({required this.appStateManager})
  //     : navigatorKey = GlobalKey<NavigatorState>() {
  //   appStateManager?.addListener(notifyListeners);
  // }

  // @override
  // void dispose() {
  //   appStateManager?.removeListener(notifyListeners);
  //   super.dispose();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   throw Navigator(
  //     key: navigatorKey,
  //     onPopPage: _handlePopPage,
  //     pages: [],
  //   );
  // }

  // bool _handlePopPage(Route<dynamic> route, result) {
  //   if (!route.didPop(result)) {
  //     return false;
  //   }
  //   return true;
  // }

  // @override
  // Future<void> setNewRoutePath(configuration) async => null;
}
