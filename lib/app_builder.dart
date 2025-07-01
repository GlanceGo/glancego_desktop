import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glancego/ui/core/widgets/window_frame_widget.dart';

final class AppBuilder extends StatelessWidget {
  const AppBuilder({required this.child, super.key});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (Platform.isLinux) {
      return WindowFrameWidget(child: SizedBox.expand(child: child));
    }

    return SizedBox.expand(child: child);
  }
}
