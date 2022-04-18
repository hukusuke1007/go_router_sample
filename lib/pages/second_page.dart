import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router_sample/widgets/rounded_button.dart';

class SecondPage extends HookWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  static String get pageName => 'second_page';

  @override
  Widget build(BuildContext context) {
    final countState = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SecondPage ${countState.value}',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: RoundedButton(
                width: 200,
                height: 40,
                child: const Text(
                  'Go SecondPage',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  //
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
