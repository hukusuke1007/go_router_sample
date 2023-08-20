import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/pages/attention/attension_page.dart';
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

/// TypedGoRoute
@TypedGoRoute<StartUpRoute>(
  path: '/',
  routes: [
    TypedStatefulShellRoute<MainRoute>(
      branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
        TypedStatefulShellBranch<BranchAData>(
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<Tab1Route>(
              path: 'tab1_page',
              name: 'tab1_page',
            ),
          ],
        ),
        TypedStatefulShellBranch<BranchBData>(
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<Tab2Route>(
              path: 'tab2_page',
              name: 'tab2_page',
            ),
          ],
        ),
      ],
    ),
    TypedGoRoute<SecondRoute>(
      path: 'second_page',
      name: 'second_page',
    ),
    TypedGoRoute<ThirdRoute>(
      path: 'third_page',
      name: 'third_page',
    ),
    TypedGoRoute<AttentionRoute>(
      path: 'attention_page',
      name: 'attention_page',
    ),
  ],
)
class StartUpRoute extends GoRouteData {
  const StartUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StartUpPage();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}

/// Router
final routerProvider = Provider(
  (ref) {
    return GoRouter(
      routes: $appRoutes,
      initialLocation: '/',
      navigatorKey: rootNavigatorKey,
      debugLogDiagnostics: kDebugMode,
      errorBuilder: (context, state) =>
          ErrorRoute(error: state.error!).build(context, state),
      // redirect: (context, state) {
      //   return state.uri.toString();
      // },
    );
  },
);
