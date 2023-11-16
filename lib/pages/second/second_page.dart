import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/pages/third/third_page.dart';
import 'package:go_router_sample/router/router.dart';
import 'package:go_router_sample/widgets/rounded_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SecondRoute extends GoRouteData {
  const SecondRoute({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SecondPage(title: title);
  }
}

class SecondPage extends ConsumerWidget {
  const SecondPage({
    required this.title,
    super.key,
  });

  final String title;

  static Future<void> push(BuildContext context, String title) async {
    return SecondRoute(title: title).push<void>(context);
  }

  static Future<void> pushWithUrl(BuildContext context, String title) async {
    return context.push<void>('/second_page?title=$title');
  }

  static final countProvider = StateProvider.autoDispose((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(title: Text('$title - ページ2')),
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
