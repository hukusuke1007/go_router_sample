import 'package:go_router/go_router.dart';
import 'package:go_router_sample/pages/error_page.dart';
import 'package:go_router_sample/pages/first_page.dart';
import 'package:go_router_sample/pages/main_page.dart';
import 'package:go_router_sample/pages/modal_page.dart';
import 'package:go_router_sample/pages/second_page.dart';
import 'package:go_router_sample/pages/third_page.dart';
import 'package:go_router_sample/utils/logger.dart';
import 'package:go_router_sample/widgets/modal_transition_page.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const MainPage(),
      routes: [
        /// パラメータ
        GoRoute(
          path: '${FirstPage.pageName}/:title',
          builder: (_, state) {
            final title = state.params['title'] ?? 'ノータイトル';
            return FirstPage(
              title: title,
            );
          },
        ),

        /// エクストラパラメータ
        GoRoute(
          path: SecondPage.pageName,
          builder: (_, state) {
            final params = state.extra! as SecondPageParams;
            return SecondPage(params);
          },
        ),
        GoRoute(
          path: ThirdPage.pageName,
          builder: (_, __) => const ThirdPage(),
        ),
      ],
    ),

    /// モーダル遷移
    GoRoute(
      path: '/${ModalPage.pageName}',
      pageBuilder: (_, state) => ModalTransitionPage<void>(
        child: const ModalPage(),
        key: state.pageKey,
      ),
    ),
  ],
  errorBuilder: (context, state) {
    logger.shout(state.error);
    return const ErrorPage();
  },
);
