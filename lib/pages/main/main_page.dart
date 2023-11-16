import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/pages/tab/tab1_page.dart';
import 'package:go_router_sample/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
  static const String $restorationScopeId = 'restorationScopeId';
}

class BranchBData extends StatefulShellBranchData {
  const BranchBData();

  static final GlobalKey<NavigatorState> $navigatorKey = tab2NavigatorKey;
  static const String $restorationScopeId = 'restorationScopeId';
}

class MainPage extends ConsumerWidget {
  const MainPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  static Future<void> go(BuildContext context) async {
    return const Tab1Route().go(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      /// スワイプバックを禁止する
      canPop: false,
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'タブ1'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'タブ2'),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: navigationShell.currentIndex,
          onTap: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
        ),
      ),
    );
  }
}
