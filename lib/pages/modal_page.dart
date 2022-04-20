import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/widgets/rounded_button.dart';

class ModalPage extends HookWidget {
  const ModalPage({
    Key? key,
  }) : super(key: key);

  static String get pageName => 'modal_page';

  @override
  Widget build(BuildContext context) {
    final countState = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ModalPage',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          onPressed: context.pop,
          icon: const Icon(Icons.close),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ModalPage ${countState.value}',
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
                  ///
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          countState.value += 1;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
