import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:glancego/data/domain/hot_key_modifier_enum.dart';
import 'package:glancego/data/domain/hot_key_scope_enum.dart';
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
      scope: HotKeyScopeEnum.global,
      key: LogicalKeyboardKey.space,
      modifiers: [HotKeyModifierEnum.alt],
      callback: () async => _appRepository.showWindow(),
    );

    await _appRepository.registerHotKey(
      key: LogicalKeyboardKey.escape,
      scope: HotKeyScopeEnum.application,
      callback: () async => _appRepository.hideWindow(),
    );
  }
}
