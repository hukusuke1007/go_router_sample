import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/pages/third_page.dart';
import 'package:go_router_sample/widgets/rounded_button.dart';

@immutable
class SecondPageParams {
  const SecondPageParams(this.title);
  final String title;
}

class SecondPage extends HookWidget {
  const SecondPage(
    this.params, {
    Key? key,
  }) : super(key: key);

  static String get pageName => 'second_page';
  static String get modalPageName => '${pageName}_with_modal';
  static String getPathPath(
    String pageName, {
    bool existsParam = false,
  }) =>
      existsParam ? '$pageName/:title' : pageName;

  final SecondPageParams params;

  @override
  Widget build(BuildContext context) {
    final countState = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ページ2 ${params.title}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
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
                  'Go ThirdPage',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  context.pushNamed(ThirdPage.pageName);
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
