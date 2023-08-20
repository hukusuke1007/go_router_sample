import 'package:go_router_sample/go_router/router.dart';
import 'package:go_router_sample/utils/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentRouteProvider =
    NotifierProvider<CurrentRoute, Uri>(CurrentRoute.new);

class CurrentRoute extends Notifier<Uri> {
  @override
  Uri build() {
    final router = ref.watch(routerProvider);
    void listener() {
      final uri = router.routeInformationProvider.value.uri;
      state = uri;
      logger.info(uri);

      // TODO(shohei): Analyticsへログを送信しても良い
    }

    router.routerDelegate.addListener(listener);
    ref.onDispose(() {
      router.routerDelegate.removeListener(listener);
    });

    final uri = router.routeInformationProvider.value.uri;
    logger.info(uri);
    // TODO(shohei): Analyticsへログを送信しても良い
    return uri;
  }
}
