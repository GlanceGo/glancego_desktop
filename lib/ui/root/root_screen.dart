import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

final class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RouterOutlet();
  }
}
