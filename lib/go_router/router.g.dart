// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainRoute,
    ];

RouteBase get $mainRoute => GoRouteData.$route(
      path: '/',
      name: 'main_page',
      factory: $MainRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'tab1_page',
          name: 'tab1_page',
          factory: $Tab1RouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'tab2_page',
          name: 'tab2_page',
          factory: $Tab2RouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'second_page/:title',
          name: 'second_page',
          factory: $SecondRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'second_page_with_modal/:title',
          name: 'second_page_with_modal',
          factory: $SecondRouteModalExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'third_page',
          name: 'third_page',
          factory: $ThirdRouteExtension._fromState,
        ),
      ],
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
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

extension $SecondRouteExtension on SecondRoute {
  static SecondRoute _fromState(GoRouterState state) => SecondRoute(
        title: state.pathParameters['title']!,
      );

  String get location => GoRouteData.$location(
        '/second_page/${Uri.encodeComponent(title)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SecondRouteModalExtension on SecondRouteModal {
  static SecondRouteModal _fromState(GoRouterState state) => SecondRouteModal(
        title: state.pathParameters['title']!,
      );

  String get location => GoRouteData.$location(
        '/second_page_with_modal/${Uri.encodeComponent(title)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

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
