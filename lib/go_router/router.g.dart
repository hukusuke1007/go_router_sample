// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $startUpRoute,
      $mainRoute,
      $secondRoute,
      $secondModalRoute,
      $thirdRoute,
    ];

RouteBase get $startUpRoute => GoRouteData.$route(
      path: '/start_up',
      name: 'start_up_page',
      parentNavigatorKey: StartUpRoute.$parentNavigatorKey,
      factory: $StartUpRouteExtension._fromState,
    );

extension $StartUpRouteExtension on StartUpRoute {
  static StartUpRoute _fromState(GoRouterState state) => const StartUpRoute();

  String get location => GoRouteData.$location(
        '/start_up',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainRoute => StatefulShellRouteData.$route(
      parentNavigatorKey: MainRoute.$parentNavigatorKey,
      restorationScopeId: MainRoute.$restorationScopeId,
      factory: $MainRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          navigatorKey: BranchAData.$navigatorKey,
          restorationScopeId: BranchAData.$restorationScopeId,
          routes: [
            GoRouteData.$route(
              path: '/tab1_page',
              name: 'tab1_page',
              factory: $Tab1RouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: BranchBData.$navigatorKey,
          restorationScopeId: BranchBData.$restorationScopeId,
          routes: [
            GoRouteData.$route(
              path: '/tab2_page',
              name: 'tab2_page',
              factory: $Tab2RouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();
}

extension $Tab1RouteExtension on Tab1Route {
  static Tab1Route _fromState(GoRouterState state) => const Tab1Route();

  String get location => GoRouteData.$location(
        '/tab1_page',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $Tab2RouteExtension on Tab2Route {
  static Tab2Route _fromState(GoRouterState state) => const Tab2Route();

  String get location => GoRouteData.$location(
        '/tab2_page',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $secondRoute => GoRouteData.$route(
      path: '/second_page',
      name: 'second_page',
      factory: $SecondRouteExtension._fromState,
    );

extension $SecondRouteExtension on SecondRoute {
  static SecondRoute _fromState(GoRouterState state) => SecondRoute(
        title: state.uri.queryParameters['title']!,
      );

  String get location => GoRouteData.$location(
        '/second_page',
        queryParams: {
          'title': title,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $secondModalRoute => GoRouteData.$route(
      path: '/second_page_with_modal',
      name: 'second_page_with_modal',
      parentNavigatorKey: SecondModalRoute.$parentNavigatorKey,
      factory: $SecondModalRouteExtension._fromState,
    );

extension $SecondModalRouteExtension on SecondModalRoute {
  static SecondModalRoute _fromState(GoRouterState state) => SecondModalRoute(
        title: state.uri.queryParameters['title']!,
      );

  String get location => GoRouteData.$location(
        '/second_page_with_modal',
        queryParams: {
          'title': title,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $thirdRoute => GoRouteData.$route(
      path: '/third_page',
      name: 'third_page',
      factory: $ThirdRouteExtension._fromState,
    );

extension $ThirdRouteExtension on ThirdRoute {
  static ThirdRoute _fromState(GoRouterState state) => const ThirdRoute();

  String get location => GoRouteData.$location(
        '/third_page',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
