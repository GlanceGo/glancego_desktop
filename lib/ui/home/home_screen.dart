import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';
import 'package:glancego/ui/core/widgets/app_item_widget.dart';
import 'package:glancego/ui/core/widgets/empty_widget.dart';
import 'package:glancego/ui/core/widgets/grid_view_widget.dart';
import 'package:glancego/ui/core/widgets/loading_widget.dart';
import 'package:glancego/ui/core/widgets/screen_widget.dart';
import 'package:glancego/ui/core/widgets/text_field_widget.dart';
import 'package:glancego/ui/core/widgets/text_widget.dart';
import 'package:glancego/ui/home/home_view_model.dart';
import 'package:solar_icon_pack/solar_icon_pack.dart';

final class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

final class _HomeScreenState extends State<HomeScreen> with AppThemeMixin {
  late final HomeViewModel _viewModel;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _viewModel = Modular.get<HomeViewModel>();
    _viewModel.getAllApps.execute();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      scrollController: _scrollController,
      header: TextFieldWidget(
        hintText: 'GlanceGo App Search',
        icon: SolarLinearIcons.widget6,
        textType: TextWidgetType.titleLarge,
        keyboardType: TextInputType.webSearch,
        textInputAction: TextInputAction.search,
        onChanged: _viewModel.searchApps.execute,
        controller: _viewModel.searchFieldController,
        onSubmitted: _viewModel.openFirstApp.execute,
      ),
      body: ValueListenableBuilder(
        valueListenable: _viewModel.getAllApps.isExecuting,
        builder: (_, isExecuting, _) {
          if (isExecuting) return const LoadingWidget();

          return ListenableBuilder(
            listenable: _viewModel,
            builder: (_, _) {
              return GridViewWidget(
                controller: _scrollController,
                count: _viewModel.apps.length,
                emptyChild: const EmptyWidget(
                  text: 'App not found',
                  icon: SolarLinearIcons.widget6,
                ),
                builder: (_, index) => AppItemWidget(
                  app: _viewModel.apps[index],
                  onPressed: _viewModel.openApp.execute,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
