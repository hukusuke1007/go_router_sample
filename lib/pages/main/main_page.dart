import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/go_router/router.dart';
import 'package:go_router_sample/pages/tab/tab1_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({
    required this.navigationShell,
    // required this.children,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  // final List<Widget> children;

  static Future<void> go(BuildContext context) async {
    return const Tab1Route().go(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      // body: IndexedStack(
      //   index: navigationShell.currentIndex,
      //   children: children,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'タブ1'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'タブ2'),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          print(index);
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
