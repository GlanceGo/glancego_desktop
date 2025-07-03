import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:glancego/data/domain/enums/hotkey_modifier_enum.dart';
import 'package:glancego/data/domain/enums/hotkey_scope_enum.dart';
import 'package:glancego/data/repositories/interaction_repository.dart';

final class RootViewModel extends ChangeNotifier {
  RootViewModel(this._interactionRepository) {
    initialize = Command.createAsyncNoParamNoResult(_initialize);
    registerHotKeys = Command.createAsyncNoParamNoResult(_registerHotKeys);
  }

  final InteractionRepository _interactionRepository;

  late final Command<void, void> initialize;
  late final Command<void, void> registerHotKeys;

  Future<void> _initialize() async => _interactionRepository.initialize();

  Future<void> _registerHotKeys() async {
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
      callback: () async => _interactionRepository.showWindow(),
    );

    await _interactionRepository.registerHotKey(
      scope: scope,
      key: hideKey,
      modifiers: modifiers,
      callback: () async => _interactionRepository.hideWindow(),
    );
  }
}
