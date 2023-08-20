import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/go_router/router.dart';
import 'package:go_router_sample/pages/main/main_page.dart';
import 'package:go_router_sample/widgets/rounded_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Route
class ThirdRoute extends GoRouteData {
  const ThirdRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ThirdPage();
}

/// Page
class ThirdPage extends ConsumerWidget {
  const ThirdPage({
    super.key,
  });

  static final countProvider = StateProvider.autoDispose((ref) => 0);

  static Future<void> push(BuildContext context) async {
    return const ThirdRoute().push(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ページ3'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ThirdPage: $count',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: RoundedButton(
                width: 120,
                height: 40,
                child: const Text(
                  'Go Back',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  context.pop();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: RoundedButton(
                width: 120,
                height: 40,
                child: const Text(
                  'Go Root',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  MainPage.go(context);
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
