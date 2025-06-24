// ignore_for_file: cascade_invocations

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:window_manager/window_manager.dart';

final class WindowService {
  const WindowService({
    required this.size,
    required this.title,
    this.center = true,
    this.skipTaskbar = true,
    this.alwaysOnTop = true,
    this.fullScreen = false,
    this.preventClose = true,
    this.hideTitlebar = true,
    this.effect = WindowEffect.mica,
    this.hideWindowControls = true,
    this.makeTitlebarTransparent = true,
    this.windowButtonVisibility = false,
    this.enableFullSizeContentView = true,
    this.alignment = Alignment.center,
    this.backgroundColor = Colors.transparent,
  });

  final Size size;
  final String title;
  final bool center;
  final bool skipTaskbar;
  final bool alwaysOnTop;
  final bool fullScreen;
  final bool preventClose;
  final bool hideTitlebar;
  final WindowEffect effect;
  final bool hideWindowControls;
  final bool makeTitlebarTransparent;
  final bool windowButtonVisibility;
  final bool enableFullSizeContentView;
  final Alignment alignment;
  final Color backgroundColor;

  Future<void> initialize() async {
    await Future.wait([
      Window.initialize(),
      windowManager.ensureInitialized(),
    ]);

    await Future.wait([
      if (hideWindowControls) Window.hideWindowControls(),
      if (preventClose) windowManager.setPreventClose(true),
      if (makeTitlebarTransparent) Window.makeTitlebarTransparent(),
      if (enableFullSizeContentView) Window.enableFullSizeContentView(),
    ]);

    doWhenWindowReady(() {
      appWindow.size = size;
      appWindow.title = title;
      appWindow.minSize = size;
      appWindow.maxSize = size;
      appWindow.alignment = alignment;
    });
  }

  Future<void> show() async {
    final options = WindowOptions(
      size: size,
      title: title,
      center: center,
      minimumSize: size,
      maximumSize: size,
      fullScreen: fullScreen,
      alwaysOnTop: alwaysOnTop,
      skipTaskbar: skipTaskbar,
      backgroundColor: backgroundColor,
      windowButtonVisibility: windowButtonVisibility,
      titleBarStyle: hideTitlebar ? TitleBarStyle.hidden : TitleBarStyle.normal,
    );

    await windowManager.waitUntilReadyToShow(options, () {
      Window.setEffect(effect: effect);

      appWindow.hide();
      appWindow.show();
      windowManager.focus();
    });
  }

  Future<void> hide() async => appWindow.hide();

  Future<void> close() async => appWindow.close();

  Future<void> restore() async => appWindow.restore();
}
