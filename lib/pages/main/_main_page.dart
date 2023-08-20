// import 'package:flutter/material.dart';
// import 'package:go_router_sample/go_router/router.dart';
// import 'package:go_router_sample/pages/tab1_page.dart';
// import 'package:go_router_sample/pages/tab2_page.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// class MainPage extends ConsumerWidget {
//   const MainPage({
//     super.key,
//   });
//
//   static Future<void> go(BuildContext context) async {
//     return const MainRoute().go(context);
//   }
//
//   static final selectedTabIndexStateProvider =
//       StateProvider.autoDispose((ref) => 0);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedTabIndex = ref.watch(selectedTabIndexStateProvider);
//
//     return Scaffold(
//       body: IndexedStack(
//         index: selectedTabIndex,
//         children: const [
//           Tab1Page(),
//           Tab2Page(),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'タブ1',
//             tooltip: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.star),
//             label: 'タブ2',
//             tooltip: '',
//           ),
//         ],
//         type: BottomNavigationBarType.fixed,
//         currentIndex: selectedTabIndex,
//         onTap: (index) {
//           ref.read(selectedTabIndexStateProvider.notifier).update(
//                 (state) => index,
//               );
//         },
//       ),
//     );
//   }
// }
