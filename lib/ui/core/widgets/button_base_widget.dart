import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class ButtonBaseWidget extends StatelessWidget {
  const ButtonBaseWidget({
    required this.child,
    this.cursor = SystemMouseCursors.click,
    this.onHover,
    this.onFocus,
    this.onPressed,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressCancel,
    super.key,
  });

  final Widget child;
  final MouseCursor cursor;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocus;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressUp;
  final VoidCallback? onLongPressDown;
  final VoidCallback? onLongPressCancel;

  @override
  Widget build(BuildContext context) {
    final onPressedIntent = VoidCallbackIntent(() => onPressed?.call());

    return FocusableActionDetector(
      onShowHoverHighlight: onHover,
      onShowFocusHighlight: onFocus,
      mouseCursor: onPressed == null ? MouseCursor.defer : cursor,
      shortcuts: {LogicalKeySet(LogicalKeyboardKey.enter): onPressedIntent},
      child: GestureDetector(
        onTap: onPressed,
        onLongPressUp: onLongPressUp,
        onLongPressCancel: onLongPressCancel,
        onLongPressDown: (_) => onLongPressDown?.call(),
        behavior: HitTestBehavior.translucent,
        child: child,
      ),
    );
  }
}
