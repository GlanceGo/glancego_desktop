import 'package:flutter/services.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:glancego/data/services/hotkey_service.dart';
import 'package:glancego/data/services/window_service.dart';
import 'package:glancego/domain/enums/hotkey_modifier_enum.dart';
import 'package:glancego/domain/enums/hotkey_scope_enum.dart';
import 'package:glancego/domain/enums/window_effect_enum.dart';
import 'package:hotkey_manager/hotkey_manager.dart';

abstract class InteractionRepository {
  Future<void> initialize();
  Future<void> showWindow({required WindowEffectEnum effect});
  Future<void> hideWindow();
  Future<void> setWindowEffect(WindowEffectEnum effect);
  Future<void> registerHotKey({
    required KeyboardKey key,
    required HotkeyScopeEnum scope,
    List<HotkeyModifierEnum> modifiers = const [],
    VoidCallback? callback,
  });
}

final class InteractionRepositoryImpl implements InteractionRepository {
  const InteractionRepositoryImpl(this._windowService, this._hotkeyService);

  final WindowService _windowService;
  final HotkeyService _hotkeyService;

  @override
  Future<void> initialize() async => Future.wait([
    _windowService.initialize(),
    _hotkeyService.initialize(),
  ]);

  @override
  Future<void> showWindow({required WindowEffectEnum effect}) async {
    final WindowEffect windowEffect;
    if (effect == WindowEffectEnum.acrylic) {
      windowEffect = WindowEffect.acrylic;
    } else {
      windowEffect = WindowEffect.transparent;
    }

    await _windowService.show(effect: windowEffect);
  }

  @override
  Future<void> hideWindow() => _windowService.hide();

  @override
  Future<void> registerHotKey({
    required KeyboardKey key,
    required HotkeyScopeEnum scope,
    List<HotkeyModifierEnum> modifiers = const [],
    VoidCallback? callback,
  }) async {
    final HotKeyScope newScope;
    switch (scope) {
      case HotkeyScopeEnum.global:
        newScope = HotKeyScope.system;
      case HotkeyScopeEnum.application:
        newScope = HotKeyScope.inapp;
    }

    final newModifiers = modifiers.map((e) {
      switch (e) {
        case HotkeyModifierEnum.alt:
          return HotKeyModifier.alt;
        case HotkeyModifierEnum.capsLock:
          return HotKeyModifier.capsLock;
        case HotkeyModifierEnum.ctrl:
          return HotKeyModifier.control;
        case HotkeyModifierEnum.fn:
          return HotKeyModifier.fn;
        case HotkeyModifierEnum.meta:
          return HotKeyModifier.meta;
        case HotkeyModifierEnum.shift:
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

  @override
  Future<void> setWindowEffect(WindowEffectEnum effect) async {
    final WindowEffect newEffect;
    if (effect == WindowEffectEnum.acrylic) {
      newEffect = WindowEffect.acrylic;
    } else {
      newEffect = WindowEffect.transparent;
    }

    await _windowService.setEffect(newEffect);
  }
}
