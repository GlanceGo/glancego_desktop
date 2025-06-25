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
    await _interactionRepository.registerHotKey(
      scope: HotkeyScopeEnum.global,
      key: LogicalKeyboardKey.space,
      modifiers: [HotkeyModifierEnum.alt],
      callback: () async => _interactionRepository.showWindow(),
    );

    await _interactionRepository.registerHotKey(
      key: LogicalKeyboardKey.escape,
      scope: HotkeyScopeEnum.application,
      callback: () async => _interactionRepository.hideWindow(),
    );
  }
}
