import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:glancego/data/domain/enums/hotkey_modifier_enum.dart';
import 'package:glancego/data/domain/enums/hotkey_scope_enum.dart';
import 'package:glancego/data/repositories/interaction_repository.dart';

final class RootViewModel extends ChangeNotifier {
  RootViewModel(this._appRepository) {
    initialize = Command.createAsyncNoParamNoResult(_initialize);
    registerHotKeys = Command.createAsyncNoParamNoResult(_registerHotKeys);
  }

  final InteractionRepository _appRepository;

  late final Command<void, void> initialize;
  late final Command<void, void> registerHotKeys;

  Future<void> _initialize() async => _appRepository.initialize();

  Future<void> _registerHotKeys() async {
    await _appRepository.registerHotKey(
      scope: HotkeyScopeEnum.global,
      key: LogicalKeyboardKey.space,
      modifiers: [HotkeyModifierEnum.alt],
      callback: () async => _appRepository.showWindow(),
    );

    await _appRepository.registerHotKey(
      key: LogicalKeyboardKey.escape,
      scope: HotkeyScopeEnum.application,
      callback: () async => _appRepository.hideWindow(),
    );
  }
}
