// [lib/core/constants/app_enums.dart]
// 선택 변수 모음

// [1] 자막 모드
enum Mode { lecture, conference }

extension ModeExtension on Mode {
  String get apiValue {
    switch(this) {
      case Mode.lecture:
        return "lecture";
      case Mode.conference:
        return "conference";
    }
  }
}

// [2]

// [3] 자막 언어 종류
//enum Language { en, ko, jp }

// [4] 서버 웹소켓 연결 상태
// enum ServerConnectionState {
//   connected,      // 정상 연결
//   disconnected,   // 연결 끊김
//   reconnecting,   // 재연결 시도
//   failed          // 연결 실패 (최대 재시도 초과)
// }

// [5] 입출력 언어 타입
// enum LanguageDialogType {
//
// }
