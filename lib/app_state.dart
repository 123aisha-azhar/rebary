import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _tagslist = prefs.getStringList('ff_tagslist') ?? _tagslist;
    });
    _safeInit(() {
      _canReport = prefs.getBool('ff_canReport') ?? _canReport;
    });
    _safeInit(() {
      _reportTime = prefs.containsKey('ff_reportTime')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_reportTime')!)
          : _reportTime;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _ddr3 = false;
  bool get ddr3 => _ddr3;
  set ddr3(bool value) {
    _ddr3 = value;
  }

  bool _search = false;
  bool get search => _search;
  set search(bool value) {
    _search = value;
  }

  bool _isShuffle = true;
  bool get isShuffle => _isShuffle;
  set isShuffle(bool value) {
    _isShuffle = value;
  }

  List<String> _tagslist = [];
  List<String> get tagslist => _tagslist;
  set tagslist(List<String> value) {
    _tagslist = value;
    prefs.setStringList('ff_tagslist', value);
  }

  void addToTagslist(String value) {
    tagslist.add(value);
    prefs.setStringList('ff_tagslist', _tagslist);
  }

  void removeFromTagslist(String value) {
    tagslist.remove(value);
    prefs.setStringList('ff_tagslist', _tagslist);
  }

  void removeAtIndexFromTagslist(int index) {
    tagslist.removeAt(index);
    prefs.setStringList('ff_tagslist', _tagslist);
  }

  void updateTagslistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    tagslist[index] = updateFn(_tagslist[index]);
    prefs.setStringList('ff_tagslist', _tagslist);
  }

  void insertAtIndexInTagslist(int index, String value) {
    tagslist.insert(index, value);
    prefs.setStringList('ff_tagslist', _tagslist);
  }

  String _appLanguage = 'KU';
  String get appLanguage => _appLanguage;
  set appLanguage(String value) {
    _appLanguage = value;
  }

  bool _dd4 = false;
  bool get dd4 => _dd4;
  set dd4(bool value) {
    _dd4 = value;
  }

  bool _dd5 = false;
  bool get dd5 => _dd5;
  set dd5(bool value) {
    _dd5 = value;
  }

  bool _dd6 = false;
  bool get dd6 => _dd6;
  set dd6(bool value) {
    _dd6 = value;
  }

  bool _show = false;
  bool get show => _show;
  set show(bool value) {
    _show = value;
  }

  bool _dd2 = false;
  bool get dd2 => _dd2;
  set dd2(bool value) {
    _dd2 = value;
  }

  bool _dd1 = false;
  bool get dd1 => _dd1;
  set dd1(bool value) {
    _dd1 = value;
  }

  bool _canReport = true;
  bool get canReport => _canReport;
  set canReport(bool value) {
    _canReport = value;
    prefs.setBool('ff_canReport', value);
  }

  DateTime? _reportTime = DateTime.fromMillisecondsSinceEpoch(1754577360000);
  DateTime? get reportTime => _reportTime;
  set reportTime(DateTime? value) {
    _reportTime = value;
    value != null
        ? prefs.setInt('ff_reportTime', value.millisecondsSinceEpoch)
        : prefs.remove('ff_reportTime');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
