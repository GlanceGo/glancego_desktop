import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:glancego/data/repositories/interaction_repository.dart';
import 'package:glancego/domain/enums/hotkey_modifier_enum.dart';
import 'package:glancego/domain/enums/hotkey_scope_enum.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';

final class RootViewModel extends ChangeNotifier with AppThemeMixin {
  RootViewModel(this._interactionRepository) {
    initialize = Command.createAsyncNoResult<BuildContext>(_initialize);
    registerHotKeys = Command.createAsyncNoParamNoResult(_registerHotKeys);
  }

  final InteractionRepository _interactionRepository;

  late final Command<BuildContext, void> initialize;
  late final Command<void, void> registerHotKeys;

  late final BuildContext _context;

  Future<void> _initialize(BuildContext context) async {
    _context = context;
    await _interactionRepository.initialize();
  }

  Future<void> _registerHotKeys() async {
    final metrics = getMetrics(_context);

    final LogicalKeyboardKey showKey;
    const scope = HotkeyScopeEnum.global;
    const hideKey = LogicalKeyboardKey.escape;
    final modifiers = [HotkeyModifierEnum.alt];

    if (Platform.isLinux) {
      showKey = LogicalKeyboardKey.keyG;
    } else {
      showKey = LogicalKeyboardKey.space;
    }

    await _interactionRepository.registerHotKey(
      scope: scope,
      key: showKey,
      modifiers: modifiers,
      callback: () async => _interactionRepository.showWindow(
        effect: metrics.window.effect,
      ),
    );

    await _interactionRepository.registerHotKey(
      scope: scope,
      key: hideKey,
      modifiers: modifiers,
      callback: () async => _interactionRepository.hideWindow(),
    );
  }
}
