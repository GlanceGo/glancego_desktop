import 'package:flutter/services.dart';
import 'package:glancego/data/domain/hot_key_modifier_enum.dart';
import 'package:glancego/data/domain/hot_key_scope_enum.dart';
import 'package:glancego/data/services/hot_key_service.dart';
import 'package:glancego/data/services/window_service.dart';
import 'package:hotkey_manager/hotkey_manager.dart';

abstract class AppRepository {
  Future<void> initialize();
  Future<void> showWindow();
  Future<void> hideWindow();
  Future<void> registerHotKey({
    required KeyboardKey key,
    required HotKeyScopeEnum scope,
    List<HotKeyModifierEnum> modifiers = const [],
    VoidCallback? callback,
  });
}

final class AppRepositoryImpl implements AppRepository {
  const AppRepositoryImpl(this._windowService, this._hotkeyService);

  final WindowService _windowService;
  final HotKeyService _hotkeyService;

  @override
  Future<void> initialize() async => Future.wait([
    _windowService.initialize(),
    _hotkeyService.initialize(),
  ]);

  @override
  Future<void> showWindow() async => _windowService.show();

  @override
  Future<void> hideWindow() => _windowService.hide();

  @override
  Future<void> registerHotKey({
    required KeyboardKey key,
    required HotKeyScopeEnum scope,
    List<HotKeyModifierEnum> modifiers = const [],
    VoidCallback? callback,
  }) async {
    final HotKeyScope newScope;
    switch (scope) {
      case HotKeyScopeEnum.global:
        newScope = HotKeyScope.system;
      case HotKeyScopeEnum.application:
        newScope = HotKeyScope.inapp;
    }

    final newModifiers = modifiers.map((e) {
      switch (e) {
        case HotKeyModifierEnum.alt:
          return HotKeyModifier.alt;
        case HotKeyModifierEnum.capsLock:
          return HotKeyModifier.capsLock;
        case HotKeyModifierEnum.ctrl:
          return HotKeyModifier.control;
        case HotKeyModifierEnum.fn:
          return HotKeyModifier.fn;
        case HotKeyModifierEnum.meta:
          return HotKeyModifier.meta;
        case HotKeyModifierEnum.shift:
          return HotKeyModifier.shift;
      }
    }).toList();

    await _hotkeyService.register(
      key: key,
      scope: newScope,
      modifiers: newModifiers,
      callback: callback,
    );
  }
}
