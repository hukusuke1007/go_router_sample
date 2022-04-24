import 'package:go_router/go_router.dart';
import 'package:go_router_sample/pages/error_page.dart';
import 'package:go_router_sample/pages/first_page.dart';
import 'package:go_router_sample/pages/main_page.dart';
import 'package:go_router_sample/pages/second_page.dart';
import 'package:go_router_sample/pages/third_page.dart';
import 'package:go_router_sample/utils/logger.dart';
import 'package:go_router_sample/widgets/modal_transition_page.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: MainPage.pagePath,
      builder: (_, __) => const MainPage(),
      routes: [
        /// パラメータ
        GoRoute(
          name: FirstPage.pageName,
          path: FirstPage.pagePath,
          builder: (_, state) {
            final title = state.params['title'] ?? '';
            return FirstPage(
              title: title,
            );
          },
        ),

        /// エクストラパラメータ + プッシュ遷移
        GoRoute(
          name: SecondPage.pageName,
          path: SecondPage.getPagePath(SecondPage.pageName),
          builder: (_, state) {
            final params = state.extra! as SecondPageParams;
            return SecondPage(params);
          },
        ),

        /// パラメータ + モーダル遷移
        GoRoute(
          name: SecondPage.modalPageName,
          path: SecondPage.getPagePath(
            SecondPage.modalPageName,
            existsParam: true,
          ),
          pageBuilder: (_, state) {
            final title = state.params['title'] ?? '';
            return ModalTransitionPage<void>(
              child: SecondPage(
                SecondPageParams(title),
              ),
              key: state.pageKey,
            );
          },
        ),

        GoRoute(
          name: ThirdPage.pageName,
          path: ThirdPage.pagePath,
          builder: (_, __) => const ThirdPage(),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) {
    logger.shout(state.error);
    return const ErrorPage();
  },
);
