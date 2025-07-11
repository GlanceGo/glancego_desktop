import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';
import 'package:glancego/ui/core/widgets/blur_widget.dart';

final class ScreenWidget extends StatefulWidget {
  const ScreenWidget({
    this.body,
    this.header,
    this.scrollController,
    super.key,
  });

  final Widget? body;
  final Widget? header;
  final ScrollController? scrollController;

  @override
  State<StatefulWidget> createState() => _ScreenWidgetState();
}

final class _ScreenWidgetState extends State<ScreenWidget> with AppThemeMixin {
  bool isBlurEnabled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController?.addListener(() {
      setState(() => isBlurEnabled = widget.scrollController!.offset > 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final metrics = getMetrics(context);

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(metrics.field.maxHeight),
        child: BlurWidget(
          isEnabled: isBlurEnabled,
          child: Padding(
            padding: EdgeInsets.all(widget.header != null ? metrics.small : 0),
            child: widget.header,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.symmetric(
                horizontal: metrics.small,
              ).copyWith(
                top: widget.header != null ? 0 : metrics.small,
                bottom: metrics.small,
              ),
          child: widget.body,
        ),
      ),
    );
  }
}
