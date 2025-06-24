import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:glancego/ui/root/root_view_model.dart';

final class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RootScreenState();
}

final class _RootScreenState extends State<RootScreen> {
  late final RootViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = Modular.get<RootViewModel>();
    _viewModel.initialize.execute();
    _viewModel.registerHotKeys.execute();
  }

  @override
  Widget build(BuildContext context) {
    return const RouterOutlet();
  }
}
