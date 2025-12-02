// [lib/providers/mode_provider.dart]
// [모드 관리]

import 'package:flutter/foundation.dart';
import 'package:re_eduscript_client/core/constants/app_enums.dart'; // [core] 모드

class ModeProvider extends ChangeNotifier {

  // [멤버 필드] 현재 모드 저장 변수
  Mode _currentMode = Mode.lecture; // 기본값 (-> 강의 모드)

  // [Getter] 현재 모드 조회
  Mode get currentMode => _currentMode;

  // [Setter] 모드 설정 (상태 업데이트)
  void setMode(Mode mode) {
    if(_currentMode != mode) {
      _currentMode = mode;
      notifyListeners();  // UI 업데이트
      debugPrint("[Provider] 모드 변경 : ${mode.name}");
    }
  }
}