import 'package:flutter/material.dart';
import 'package:go_router_sample/app.dart';
import 'package:go_router_sample/utils/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.configure();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
