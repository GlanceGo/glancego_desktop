import 'package:flutter/services.dart';
import 'package:hotkey_manager/hotkey_manager.dart';

final class HotkeyService {
  const HotkeyService();

  Future<void> initialize() async => hotKeyManager.unregisterAll();

  Future<void> register({
    required KeyboardKey key,
    required HotKeyScope scope,
    List<HotKeyModifier> modifiers = const [],
    VoidCallback? callback,
  }) async {
    final hotKey = HotKey(key: key, modifiers: modifiers, scope: scope);
    await hotKeyManager.register(
      hotKey,
      keyDownHandler: (_) => callback?.call(),
    );
  }
}
