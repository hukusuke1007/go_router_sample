import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/go_router/router.dart';
import 'package:go_router_sample/pages/third_page.dart';
import 'package:go_router_sample/widgets/rounded_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// SecondRoute
class SecondRoute extends GoRouteData {
  const SecondRoute({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      SecondPage(title: title);
}

class SecondRouteModal extends GoRouteData {
  const SecondRouteModal({
    required this.title,
  });

  final String title;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      CupertinoPage(
        fullscreenDialog: true,
        child: SecondPage(title: title),
      );
}

/// Page
class SecondPage extends ConsumerWidget {
  const SecondPage({
    required this.title,
    super.key,
  });

  final String title;

  static Future<void> push(BuildContext context, String title) async {
    return SecondRoute(title: title).push<void>(context);
  }

  static Future<void> pushWithModal(BuildContext context, String title) async {
    return SecondRouteModal(title: title).push<void>(context);
  }

  static final countProvider = StateProvider.autoDispose((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('$title - ページ2 '),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SecondPage: $count',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: RoundedButton(
                width: 200,
                height: 40,
                child: const Text(
                  'Go ThirdPage',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  ThirdPage.push(context);
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
