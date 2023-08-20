import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/go_router/transition_observer.dart';
import 'package:go_router_sample/pages/error_page.dart';
import 'package:go_router_sample/pages/main_page.dart';
import 'package:go_router_sample/pages/second_page.dart';
import 'package:go_router_sample/pages/tab1_page.dart';
import 'package:go_router_sample/pages/tab2_page.dart';
import 'package:go_router_sample/pages/third_page.dart';
import 'package:go_router_sample/utils/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'router.g.dart';

/// TypeGoRoute
@TypedGoRoute<MainRoute>(
  path: '/',
  name: 'main_page',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<Tab1Route>(
      name: 'tab1_page',
      path: 'tab1_page',
    ),
    TypedGoRoute<Tab2Route>(
      name: 'tab2_page',
      path: 'tab2_page',
    ),
    TypedGoRoute<SecondRoute>(
      name: 'second_page',
      path: 'second_page/:title',
    ),
    TypedGoRoute<SecondRouteModal>(
      name: 'second_page_with_modal',
      path: 'second_page_with_modal/:title',
    ),
    TypedGoRoute<ThirdRoute>(
      name: 'third_page',
      path: 'third_page',
    ),
  ],
)

/// MainRoute
class MainRoute extends GoRouteData {
  const MainRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const MainPage();
}

/// Router
final routerProvider = Provider((ref) {
  final transitionObserver = ref.watch(transitionObserverProvider);
  final navigatorKey = ref.watch(navigatorKeyProvider);
  return GoRouter(
    routes: $appRoutes,
    navigatorKey: navigatorKey,
    observers: [transitionObserver],
    debugLogDiagnostics: kDebugMode,
    errorBuilder: (context, state) =>
        ErrorRoute(error: state.error!).build(context, state),
  );
});
