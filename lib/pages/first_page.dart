import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/pages/second_page.dart';
import 'package:go_router_sample/widgets/rounded_button.dart';

class FirstPage extends HookWidget {
  const FirstPage({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  static String get pageName => 'first_page';
  static String get pagePath => '$pageName/:title';

  @override
  Widget build(BuildContext context) {
    final countState = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'FirstPage ${countState.value}',
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
                  context.push(
                    '/${SecondPage.pageName}',
                    extra: SecondPageParams(
                      '$titleから',
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: RoundedButton(
                width: 200,
                height: 40,
                child: const Text(
                  'Go Modal',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  context.pushNamed(
                    SecondPage.modalPageName,
                    params: {'title': '$titleからモーダル表示'},
                  );
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
