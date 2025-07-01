import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:glancego/data/repositories/interaction_repository.dart';
import 'package:glancego/data/services/hotkey_service.dart';
import 'package:glancego/data/services/window_service.dart';
import 'package:glancego/main.dart';
import 'package:glancego/routing/app_routes.dart';
import 'package:glancego/ui/home/home_module.dart';
import 'package:glancego/ui/root/root_screen.dart';
import 'package:glancego/ui/root/root_view_model.dart';

final class RootModule extends Module {
  @override
  void binds(Injector i) {
    final WindowEffect effect;
    if (Platform.isLinux) {
      effect = WindowEffect.solid;
    } else {
      effect = WindowEffect.mica;
    }

    const hotkeyService = HotkeyService();
    final windowService = WindowService(
      title: title,
      effect: effect,
      size: const Size(600, 500),
    );

    i
      ..addSingleton<InteractionRepository>(
        () => InteractionRepositoryImpl(windowService, hotkeyService),
      )
      ..addSingleton<RootViewModel>(
        () => RootViewModel(i.get<InteractionRepository>()),
      );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      AppRoutes.root,
      child: (_) => const RootScreen(),
      children: [ModuleRoute(AppRoutes.home, module: HomeModule())],
    );
  }
}
