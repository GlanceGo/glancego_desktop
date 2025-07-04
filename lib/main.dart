import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:glancego/app_builder.dart';
import 'package:glancego/routing/app_routes.dart';
import 'package:glancego/ui/core/theme/app_theme.dart';
import 'package:glancego/ui/root/root_module.dart';

const title = 'GlanceGo';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Command.globalExceptionHandler = (err, stack) {
    log(err.toString(), name: 'Command', stackTrace: stack);
  };

  runApp(ModularApp(module: RootModule(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

final class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Modular.setInitialRoute(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: title,
      debugShowCheckedModeBanner: false,
      themeAnimationCurve: Curves.easeInOut,
      theme: AppTheme.getData(isDark: false),
      darkTheme: AppTheme.getData(isDark: true),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      builder: (_, child) => AppBuilder(child: child),
    );
  }
}
