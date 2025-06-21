import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:glancego/ui/core/theme/app_theme.dart';
import 'package:window_manager/window_manager.dart';

const title = 'GlanceGo';
const size = Size(600, 500);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initWindow();
  runApp(const MyApp());
  _showWindow();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      themeAnimationCurve: Curves.easeInOut,
      theme: AppTheme.getData(isDark: false),
      darkTheme: AppTheme.getData(isDark: true),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.transparent);
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
    windowManager.waitUntilReadyToShow(options),
    Window.setEffect(effect: WindowEffect.acrylic),
  ]);
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
