import 'package:flutter/material.dart';

import '../../utils/logger.dart';

enum TransitionType {
  push,
  pop,
}

class TransitionObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _onTransition(route, previousRoute, TransitionType.push);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _onTransition(route, previousRoute, TransitionType.pop);
  }

  void _onTransition(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
    TransitionType transitionType,
  ) {
    final pageName = route.settings.name;
    logger.info('pageName: $pageName, ${transitionType.name}');
  }
}
