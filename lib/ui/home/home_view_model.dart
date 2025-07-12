import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:glancego/data/repositories/apps/apps_repository.dart';
import 'package:glancego/data/repositories/interaction_repository.dart';
import 'package:glancego/domain/entities/app_entity.dart';

final class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._appsRepository, this._interactionRepository) {
    getAllApps = Command.createAsyncNoParamNoResult(_getAllApps);
    searchApps = Command.createSyncNoResult<String>(_searchApps);
    openApp = Command.createAsyncNoResult<AppEntity>(_openApp);
    openFirstApp = Command.createAsyncNoParamNoResult(_openFirstApp);
  }

  final AppsRepository _appsRepository;
  final InteractionRepository _interactionRepository;

  List<AppEntity> _apps = [];
  List<AppEntity> _filteredApps = [];
  final _searchFieldController = TextEditingController();

  List<AppEntity> get apps => _filteredApps;
  TextEditingController get searchFieldController => _searchFieldController;

  late final Command<void, void> getAllApps;
  late final Command<String, void> searchApps;
  late final Command<AppEntity, void> openApp;
  late final Command<void, void> openFirstApp;

  Future<void> _getAllApps() async {
    final result = await _appsRepository.getAll();

    _apps = result;
    _filteredApps = result;
    notifyListeners();
  }

  void _searchApps(String text) {
    if (text.isEmpty) {
      _filteredApps = _apps;
      notifyListeners();
      return;
    }

    final result = _apps.where((app) {
      final query = removeDiacritics(text.toLowerCase());
      final name = removeDiacritics(app.name.toLowerCase());
      return name.contains(query);
    });

    _filteredApps = result.toList();
    _filteredApps.sort((a, b) {
      final aText = removeDiacritics(a.name.toLowerCase());
      final bText = removeDiacritics(b.name.toLowerCase());

      final aHas = aText.contains(' ');
      final bHas = bText.contains(' ');

      if (aHas && !bHas) return 1;
      if (!aHas && bHas) return -1;
      return aText.compareTo(bText);
    });

    notifyListeners();
  }

  Future<void> _openApp(AppEntity app) async => Future.wait([
    _appsRepository.open(app),
    _interactionRepository.hideWindow(),
  ]);

  Future<void> _openFirstApp() async {
    if (_searchFieldController.text.isEmpty) return;

    await Future.wait([
      _interactionRepository.hideWindow(),
      _appsRepository.open(_filteredApps.first),
    ]);
  }

  @override
  void dispose() {
    openApp.dispose();
    searchApps.dispose();
    getAllApps.dispose();

    _searchFieldController.dispose();
    super.dispose();
  }
}
