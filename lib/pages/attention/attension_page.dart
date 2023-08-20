import 'package:flutter/material.dart';
import 'package:go_router_sample/go_router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AttentionPage extends ConsumerWidget {
  const AttentionPage({
    super.key,
  });

  static Future<void> push(BuildContext context) async {
    return const AttentionRoute().push<void>(context);
  }

  static final countProvider = StateProvider.autoDispose((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AttentionPage'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'AttentionPage: $count',
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
