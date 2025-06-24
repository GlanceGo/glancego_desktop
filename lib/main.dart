import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:glancego/routing/app_routes.dart';
import 'package:glancego/ui/core/theme/app_theme.dart';
import 'package:glancego/ui/root/root_module.dart';
import 'package:window_manager/window_manager.dart';

const title = 'GlanceGo';
const size = Size(600, 500);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initWindow();
  runApp(ModularApp(module: RootModule(), child: const MyApp()));
  _showWindow();
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
    Modular.setInitialRoute(AppRoutes.root);
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
    );
  }
}

Future<void> _initWindow() async {
  const options = WindowOptions(
    size: size,
    title: title,
    center: true,
    skipTaskbar: true,
    minimumSize: size,
    maximumSize: size,
    alwaysOnTop: true,
    fullScreen: false,
    windowButtonVisibility: false,
    titleBarStyle: TitleBarStyle.hidden,
    backgroundColor: Colors.transparent,
  );

  await Future.wait([
    Window.initialize(),
    windowManager.ensureInitialized(),
  ]);

  await Future.wait([
    Window.hideWindowControls(),
    Window.makeTitlebarTransparent(),
    Window.enableFullSizeContentView(),
  ]);

  await windowManager.waitUntilReadyToShow(options);
  await Window.setEffect(effect: WindowEffect.acrylic);
}

void _showWindow() {
  doWhenWindowReady(() {
    appWindow.size = size;
    appWindow.title = title;
    appWindow.minSize = size;
    appWindow.maxSize = size;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}
