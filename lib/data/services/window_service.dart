import 'dart:io';

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
      if (preventClose) windowManager.setPreventClose(true),
      if (makeTitlebarTransparent && Platform.isMacOS)
        Window.makeTitlebarTransparent(),
      if (enableFullSizeContentView && Platform.isMacOS)
        Window.enableFullSizeContentView(),
      if (hideWindowControls && !Platform.isLinux) Window.hideWindowControls(),
    ]);

    doWhenWindowReady(() {
      appWindow.size = size;
      appWindow.title = title;
      appWindow.minSize = size;
      appWindow.maxSize = size;
      appWindow.alignment = alignment;
      appWindow.hide();
    });
  }

  Future<void> show({required WindowEffect effect}) async {
    final TitleBarStyle titleBarStyle;
    if (hideTitlebar) {
      titleBarStyle = TitleBarStyle.hidden;
    } else {
      titleBarStyle = TitleBarStyle.normal;
    }

    final options = WindowOptions(
      size: size,
      title: title,
      center: center,
      minimumSize: size,
      maximumSize: size,
      fullScreen: fullScreen,
      alwaysOnTop: alwaysOnTop,
      skipTaskbar: skipTaskbar,
      titleBarStyle: titleBarStyle,
      backgroundColor: backgroundColor,
      windowButtonVisibility: windowButtonVisibility,
    );

    await windowManager.waitUntilReadyToShow(options, () async {
      await Window.setEffect(color: backgroundColor, effect: effect);

      appWindow
        ..hide()
        ..show();

      await windowManager.focus();
    });
  }

  Future<void> hide() async => appWindow.hide();

  Future<void> close() async => appWindow.close();

  Future<void> restore() async => appWindow.restore();

  Future<void> setEffect(WindowEffect effect) async => Window.setEffect(
    effect: effect,
    color: backgroundColor,
  );
}
