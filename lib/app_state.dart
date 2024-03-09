import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _completedQuestions = 0;
  int get completedQuestions => _completedQuestions;
  set completedQuestions(int value) {
    _completedQuestions = value;
  }

  int _score = 0;
  int get score => _score;
  set score(int value) {
    _score = value;
  }

  bool _alternativaCorreta = false;
  bool get alternativaCorreta => _alternativaCorreta;
  set alternativaCorreta(bool value) {
    _alternativaCorreta = value;
  }

  String _urlCorrectA = '';
  String get urlCorrectA => _urlCorrectA;
  set urlCorrectA(String value) {
    _urlCorrectA = value;
  }

  String _urlCorrectB = '';
  String get urlCorrectB => _urlCorrectB;
  set urlCorrectB(String value) {
    _urlCorrectB = value;
  }

  String _urlCorrectC = '';
  String get urlCorrectC => _urlCorrectC;
  set urlCorrectC(String value) {
    _urlCorrectC = value;
  }

  String _urlCorrectD = '';
  String get urlCorrectD => _urlCorrectD;
  set urlCorrectD(String value) {
    _urlCorrectD = value;
  }
}
