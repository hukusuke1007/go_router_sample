import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AttentionDetailRoute extends GoRouteData {
  const AttentionDetailRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AttentionDetailPage();
  }

  /// AttentionPageからpush遷移するために必要
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}

class AttentionDetailPage extends ConsumerWidget {
  const AttentionDetailPage({
    super.key,
  });

  static Future<void> push(BuildContext context) async {
    return const AttentionDetailRoute().push(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('AttentionDetailPage')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'AttentionDetailPage',
            ),
          ],
        ),
      ),
    );
  }
}
