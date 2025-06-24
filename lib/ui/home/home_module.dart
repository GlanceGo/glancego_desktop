import 'package:flutter_modular/flutter_modular.dart';
import 'package:glancego/routing/app_routes.dart';
import 'package:glancego/ui/home/home_screen.dart';

final class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.root, child: (_) => const HomeScreen());
  }
}
