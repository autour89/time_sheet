import 'dart:async';

import 'package:get/get.dart';
import 'package:time_sheet/models/RecordModel.dart';

class HomeBloc extends GetxController {
  final int _delay = 500;
  RxList<RecordModel> _records = RxList.empty();
  bool _composerActive = false;
  bool _isSearching = false;
  String _searchQuery = '';
  Timer? _debounce;
  int _rate = 20;

  get records => _isSearching
      ? _records.where((c) => c.toString().contains(_searchQuery)).toList()
      : _records;

  get isSearching => _isSearching;
  get composerActive => _composerActive;

  set search(bool searching) {
    _isSearching = searching;
    _searchQuery = '';
    update();
  }

  set newRecord(bool showComposer) {
    _composerActive = showComposer;
    update();
  }

  HomeBloc() {
    // _records.addAll([
    //   RecordModel(title: 'title 1', rate: _rate),
    //   RecordModel(title: 'title 2', rate: _rate),
    //   RecordModel(title: 'title 3', rate: _rate),
    // ]);
  }

  void updateSearchQuery(String newQuery) {
    _searchQuery = newQuery;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: _delay), update);
  }

  void addRecord(String title) {
    if (title.isEmpty) return;
    _records.add(RecordModel(title: title, rate: _rate));
    newRecord = false;
    update();
  }

  void removeRecord(RecordModel record) {
    _records.remove(record);
    update();
  }

  void submitRecord(RecordModel record) {
    record.state = RecordState.submitted;
    update();
  }

  void updateRecord(RecordModel record, int index) {
    _records[index] = record;
    update();
  }
}
