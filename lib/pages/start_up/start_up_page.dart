import 'package:flutter/material.dart';
import 'package:go_router_sample/pages/main/main_page.dart';
import 'package:go_router_sample/router/current_route.dart';
import 'package:go_router_sample/widgets/rounded_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StartUpPage extends ConsumerWidget {
  const StartUpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// currentRouteを活性化させる
    ref.watch(currentRouteProvider);

    return Scaffold(
      body: Center(
        child: RoundedButton(
          width: 120,
          height: 40,
          child: const Text(
            'Go Main',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            MainPage.go(context);
          },
        ),
      ),
    );
  }
}
