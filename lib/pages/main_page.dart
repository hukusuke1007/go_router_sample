import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router_sample/pages/first_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  static String get pageName => 'main_page';
  static String get pagePath => '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageViewController = usePageController();
    final selectedIndexState = useState(0);

    return Scaffold(
      body: PageView(
        controller: pageViewController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          FirstPage(
            title: 'タブ1',
          ),
          FirstPage(
            title: 'タブ2',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'タブ1',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'タブ2',
            tooltip: '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndexState.value,
        onTap: (index) {
          selectedIndexState.value = index;
          pageViewController.jumpToPage(index);
        },
      ),
    );
  }
}
