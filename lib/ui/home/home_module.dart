import 'package:flutter_modular/flutter_modular.dart';
import 'package:glancego/data/repositories/apps/apps_repository.dart';
import 'package:glancego/data/repositories/apps/windows_apps_repository.dart';
import 'package:glancego/data/repositories/interaction_repository.dart';
import 'package:glancego/data/services/directory_service.dart';
import 'package:glancego/data/services/process_service.dart';
import 'package:glancego/routing/app_routes.dart';
import 'package:glancego/ui/home/home_screen.dart';
import 'package:glancego/ui/home/home_view_model.dart';
import 'package:glancego/ui/root/root_module.dart';

final class HomeModule extends Module {
  @override
  List<Module> get imports => [RootModule()];

  @override
  void binds(Injector i) {
    i
      ..addSingleton<AppsRepository>(
        () => const WindowsAppsRepository(ProcessService(), DirectoryService()),
      )
      ..addSingleton<HomeViewModel>(
        () => HomeViewModel(i<AppsRepository>(), i<InteractionRepository>()),
      );
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.root, child: (_) => const HomeScreen());
  }
}
