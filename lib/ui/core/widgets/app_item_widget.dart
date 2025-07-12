import 'package:flutter/material.dart';
import 'package:glancego/domain/entities/app_entity.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';
import 'package:glancego/ui/core/widgets/button_base_widget.dart';
import 'package:glancego/ui/core/widgets/container_widget.dart';
import 'package:glancego/ui/core/widgets/image_widget.dart';
import 'package:glancego/ui/core/widgets/text_widget.dart';

final class AppItemWidget extends StatefulWidget {
  const AppItemWidget({required this.app, this.onPressed, super.key});

  final AppEntity app;
  final ValueChanged<AppEntity>? onPressed;

  @override
  State<StatefulWidget> createState() => _AppItemWidgetState();
}

final class _AppItemWidgetState extends State<AppItemWidget>
    with AppThemeMixin {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics, _, _) = getTheme(context);

    final Color bgColor;
    final Color fgColor;
    if (_isHovering) {
      bgColor = colors.primary;
      fgColor = colors.onPrimary;
    } else {
      bgColor = colors.primary.withValues(alpha: 0);
      fgColor = colors.onSurface;
    }

    return ButtonBaseWidget(
      onPressed: () => widget.onPressed?.call(widget.app),
      onHover: (isHovering) => setState(() => _isHovering = isHovering),
      onFocus: (isHovering) => setState(() => _isHovering = isHovering),
      child: ContainerWidget(
        padding: EdgeInsets.all(metrics.small),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(metrics.small),
        ),
        child: Column(
          spacing: metrics.small,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidget(
              width: 32,
              height: 32,
              fit: BoxFit.contain,
              data: widget.app.icon,
            ),
            TextWidget(
              widget.app.name,
              color: fgColor,
              type: TextWidgetType.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
