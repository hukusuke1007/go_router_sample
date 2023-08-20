import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/pages/attention/attension_page.dart';
import 'package:go_router_sample/pages/second/second_page.dart';
import 'package:go_router_sample/widgets/rounded_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Route
class Tab1Route extends GoRouteData {
  const Tab1Route();

  @override
  Widget build(BuildContext context, GoRouterState state) => const Tab1Page();
}

/// Page
class Tab1Page extends ConsumerWidget {
  const Tab1Page({
    super.key,
  });

  static final countProvider = StateProvider.autoDispose((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('タブ1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tab1Page: $count',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: RoundedButton(
                width: 200,
                height: 40,
                child: const Text(
                  'Go SecondPage',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  SecondPage.push(context, 'タブ1');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: RoundedButton(
                width: 200,
                height: 40,
                child: const Text(
                  'Go Modal',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  AttentionPage.push(context);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          ref.read(countProvider.notifier).update((state) => count + 1);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
