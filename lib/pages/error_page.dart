import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/widgets/rounded_button.dart';

/// ErrorRoute
class ErrorRoute extends GoRouteData {
  ErrorRoute({required this.error});
  final Exception error;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ErrorPage(error: error);
}

class ErrorPage extends HookWidget {
  const ErrorPage({
    required this.error,
    super.key,
  });

  static String get pageName => 'error_page';
  final Exception error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ErrorPage',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Error: $error',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: RoundedButton(
                width: 200,
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
          ],
        ),
      ),
    );
  }
}
