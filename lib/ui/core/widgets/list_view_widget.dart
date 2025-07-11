import 'package:flutter/material.dart';
import 'package:glancego/ui/core/widgets/spacer_widget.dart';

final class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    required this.count,
    required this.builder,
    this.direction = Axis.vertical,
    this.emptyChild,
    this.controller,
    super.key,
  });

  final int count;
  final Widget Function(BuildContext context, int index) builder;
  final Axis direction;
  final Widget? emptyChild;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    if (count == 0) return SizedBox.expand(child: emptyChild);

    return ListView.separated(
      itemCount: count,
      itemBuilder: builder,
      controller: controller,
      scrollDirection: direction,
      separatorBuilder: (_, _) {
        return SpacerWidget(
          direction: direction,
          size: SpacerWidgetSize.small,
        );
      },
    );
  }
}
