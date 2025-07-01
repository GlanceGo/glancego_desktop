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
    final HotkeyScopeEnum hideScope;
    final LogicalKeyboardKey showKey;
    final List<HotkeyModifierEnum> hideModifiers;

    if (Platform.isLinux) {
      hideScope = HotkeyScopeEnum.global;
      showKey = LogicalKeyboardKey.keyG;
      hideModifiers = [HotkeyModifierEnum.alt];
    } else {
      hideScope = HotkeyScopeEnum.application;
      showKey = LogicalKeyboardKey.space;
      hideModifiers = [];
    }

    await Future.wait([
      _interactionRepository.registerHotKey(
        scope: hideScope,
        modifiers: hideModifiers,
        key: LogicalKeyboardKey.escape,
        callback: () async => _interactionRepository.hideWindow(),
      ),
      _interactionRepository.registerHotKey(
        key: showKey,
        scope: HotkeyScopeEnum.global,
        modifiers: [HotkeyModifierEnum.alt],
        callback: () async => _interactionRepository.showWindow(),
      ),
    ]);
  }
}
