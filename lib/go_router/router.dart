import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/go_router/transition_observer.dart';
import 'package:go_router_sample/pages/error/error_page.dart';
import 'package:go_router_sample/pages/main/main_page.dart';
import 'package:go_router_sample/pages/second/second_page.dart';
import 'package:go_router_sample/pages/start_up/start_up_page.dart';
import 'package:go_router_sample/pages/tab/tab1_page.dart';
import 'package:go_router_sample/pages/tab/tab2_page.dart';
import 'package:go_router_sample/pages/third/third_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'router.g.dart';

/// NavigatorKey
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');
final tab1NavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'tab1');
final tab2NavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'tab2');

/// StartUpRoute
@TypedGoRoute<StartUpRoute>(path: '/start_up', name: 'start_up_page')
class StartUpRoute extends GoRouteData {
  const StartUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StartUpPage();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}

/// TypedStatefulShellRoute
@TypedStatefulShellRoute<MainRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<BranchAData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<Tab1Route>(
          path: '/tab1_page',
          name: 'tab1_page',
        ),
      ],
    ),
    TypedStatefulShellBranch<BranchBData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<Tab2Route>(
          path: '/tab2_page',
          name: 'tab2_page',
        ),
      ],
    ),
  ],
)
class MainRoute extends StatefulShellRouteData {
  const MainRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MainPage(
      navigationShell: navigationShell,
    );
  }

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
  static const String $restorationScopeId = 'restorationScopeId';
}

class BranchAData extends StatefulShellBranchData {
  const BranchAData();

  static final GlobalKey<NavigatorState> $navigatorKey = tab1NavigatorKey;
  static const String $restorationScopeId = 'restorationScopeIdA';
}

class BranchBData extends StatefulShellBranchData {
  const BranchBData();

  static final GlobalKey<NavigatorState> $navigatorKey = tab2NavigatorKey;
  static const String $restorationScopeId = 'restorationScopeIdB';
}

/// SecondRoute
@TypedGoRoute<SecondRoute>(
  path: '/second_page',
  name: 'second_page',
)
class SecondRoute extends GoRouteData {
  const SecondRoute({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      SecondPage(title: title);
}

/// SecondModalRoute
@TypedGoRoute<SecondModalRoute>(
  path: '/second_page_with_modal',
  name: 'second_page_with_modal',
)
class SecondModalRoute extends GoRouteData {
  const SecondModalRoute({
    required this.title,
  });

  final String title;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      CupertinoPage(
        fullscreenDialog: true,
        child: SecondPage(title: title),
      );

  // Root表示するためにKeyを設定する
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}

/// ThirdRoute
@TypedGoRoute<ThirdRoute>(
  path: '/third_page',
  name: 'third_page',
)
class ThirdRoute extends GoRouteData {
  const ThirdRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ThirdPage();
}

/// Router
final routerProvider = Provider(
  (ref) {
    final transitionObserver = TransitionObserver();
    return GoRouter(
      routes: $appRoutes,
      initialLocation: '/start_up',
      navigatorKey: rootNavigatorKey,
      observers: [transitionObserver],
      debugLogDiagnostics: kDebugMode,
      errorBuilder: (context, state) =>
          ErrorRoute(error: state.error!).build(context, state),
    );
  },
);
