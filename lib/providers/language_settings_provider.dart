// [lib/providers/language_settings_provider.dart]
// [입출력 언어 관리]

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:re_eduscript_client/core/constants/app_enums.dart'; // [core] 모드
import 'package:re_eduscript_client/providers/mode_provider.dart'; // [providers] 모드

class LanguageSettingsProvider extends ChangeNotifier {

  // [현재 모드 확인]
  final ModeProvider _modeProvider;
  LanguageSettingsProvider(this._modeProvider);

  // [멤버 필드]
  List<String> _selectedInputLanguages = ['한국어'];   // 입력 언어
  List<String> _selectedOutputLanguages = ['한국어'];  // 출력 언어

  // [Getter] 현재 상태 받아오기
  List<String> get selectedInputLanguages => _selectedInputLanguages;
  List<String> get selectedOutputLanguages => _selectedOutputLanguages;

  // [Setter] 상태 업데이트

  // 1) 입력 언어 설정 변경
  void updateInputLanguages(List<String> languages) {
    _selectedInputLanguages = languages;

    // (동기화) "토론 모드"일 때 -> 출력 언어 동기화
    if (_modeProvider.currentMode == Mode.conference) {
      _selectedOutputLanguages = List.from(languages); // 출력 언어 동기화
    }

    notifyListeners();
  }
  // 2) 출력 언어 설정 변경
  void updateOutputLanguages(List<String> languages) {
    _selectedOutputLanguages = languages;

    // (동기화) "토론 모드"일 때 -> 출력 언어 동기화
    if (_modeProvider.currentMode == Mode.conference) {
      _selectedInputLanguages = List.from(languages); // 입력 언어 동기화
    }

    notifyListeners();
  }
}