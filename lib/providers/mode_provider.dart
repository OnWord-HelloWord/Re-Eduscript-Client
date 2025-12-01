// [lib/providers/mode_provider.dart]
// 모드 선택 프로바이더

import 'package:flutter/foundation.dart';
import '../core/constants/app_enums.dart';

class ModeProvider extends ChangeNotifier {

  // [멤버 필드] 현재 모드
  Mode _currentMode = Mode.lecture; // 기본값 (강의 모드)

  // [Getter] 현재 모드 조회
  Mode get currentMoe => _currentMode;

  // [Setter] 모드 설정
  void setMode(Mode mode) {
    if(_currentMode != mode) {
      _currentMode = mode;
      notifyListeners();  // UI 업데이트
      debugPrint("[Provider] 모드 변경 : ${mode.name}");
    }
  }

  // 모드 전환
  void changeMode() {
    setMode(_currentMode == Mode.lecture ? Mode.conference : Mode.lecture);
  }
}