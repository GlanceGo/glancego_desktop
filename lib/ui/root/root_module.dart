import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:glancego/data/repositories/app_repository.dart';
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
    const hotkeyService = HotkeyService();
    const windowService = WindowService(title: title, size: Size(600, 500));

    i
      ..addSingleton<AppRepository>(
        () => const AppRepositoryImpl(windowService, hotkeyService),
      )
      ..addSingleton<RootViewModel>(
        () => RootViewModel(i.get<AppRepository>()),
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
