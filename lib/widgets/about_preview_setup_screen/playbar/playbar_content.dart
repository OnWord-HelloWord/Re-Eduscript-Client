// [lib/widgets/about_preview_setup_screen/playbar/playbar_content.dart]
// [플레이바 컨텐트]

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/core/styles/app_colors.dart';
import 'package:re_eduscript_client/core/utils/timer_manager.dart';
import 'package:re_eduscript_client/providers/subtitle_style_provider.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/playbar/play_pause_button_widget.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/playbar/playbar_view.dart';

import '../../../core/styles/app_sizes.dart';     // [cores] 사이즈

class PlaybarContent extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;
  final VoidCallback? onLectureEnd;
  final int? counterValue;

  const PlaybarContent({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    this.onLectureEnd,
    this.counterValue,
  });

  @override
  State<PlaybarContent> createState() => _PlaybarContentState();
}

class _PlaybarContentState extends State<PlaybarContent> {
  bool hasStarted = false; // 초기 시작 상태

  // [서비스 할당]

  //

  @override
  Widget build(BuildContext context) {
    return PlaybarView(
        screenWidth: widget.screenWidth,
        isPlaying: TimerManager.isPlaying, // 타이머 상태
        hasStarted: hasStarted,
        displayTime: TimerManager.formattedTime, // 타이머 시간
        onPlayPause: _handlePlayPause,
        onCancel: _handleCancel,
        onStop: _handleStop
    );
  }

  // [버튼 핸들러]
  // [1] 재생/일시정지
  void _handlePlayPause() async {
    // // 1) 재생 버튼 눌렀을 때
    // if (!TimerManager.isPlaying) {
    //   // 자막 모드 확인 (화면 공유 or 자막 ONLY)
    //   final subtitleSettings = context.read<SubtitleStyleProvider>();
    //   // -> "화면 공유" 모드가 켜져 있는데
    //   if (subtitleSettings.screenSharedEnabled) {
    //     // -> 사용자 PC의 OS 확인 (윈도우가 아닐 때)
    //     if (!Platform.isWindows) {
    //       // -> 경고창 띄우기 (Mac/Linux면 Win32 API를 호출할 수 없음)
    //       if (mounted) {
    //         showDialog(
    //           context: context,
    //           builder:
    //               (context) => AlertDialog(
    //             title: const Text('기능 안내'),
    //             content: const Text(
    //               '화면 공유 자막(오버레이) 기능은 Windows에서만 사용할 수 있습니다.',
    //             ),
    //             actions: [
    //               TextButton(
    //                 onPressed: () => Navigator.pop(context),
    //                 child: const Text('확인'),
    //               ),
    //             ],
    //           ),
    //         );
    //       }
    //       // Navigator.push 전에 return (강의 시작 중단)
    //       return;
    //     }
    //   }
    //   TimerManager.start(); // 타이머 실행
    //   setState(() {
    //     hasStarted = true;
    //   });
    //   debugPrint('강의 시작 - 모드: ${_currentMode.toString()}');
    //
    //   final service = currentService; // 현재 서비스 가져오기
    //
    //   if (service.isConnected) {
    //     await service.startRecording();
    //     debugPrint("기존 연결로 녹음 재시작");
    //   } else {
    //     // Provider에서 언어 설정 가져오기
    //     final subtitleSettings = context.read<SubtitleSettingsProvider>();
    //     final inputLanguageCodes = subtitleSettings.getInputLanguageCodes();
    //     final outputLanguageCodes = subtitleSettings.getOutputLanguageCodes();
    //
    //     debugPrint("🌐 언어 설정:");
    //     debugPrint(
    //       "  입력: ${subtitleSettings.selectedInputLanguages} -> $inputLanguageCodes",
    //     );
    //     debugPrint(
    //       "  출력: ${subtitleSettings.selectedOutputLanguages} -> $outputLanguageCodes",
    //     );
    //
    //     await _startSTTService(
    //       inputLanguageCodes: inputLanguageCodes,
    //       outputLanguageCodes: outputLanguageCodes,
    //     );
    //   }
    //
    //   // 화면 전환 및 상태 업데이트
    //   if (mounted) {
    //     dynamic result; // 상태 변수 (Close 버튼 클릭 여부)
    //
    //     // 화면 공유 모드 && 윈도우 환경일 때
    //     // 1) 화면 공유 모드 (오버레이) 화면 전환
    //     if (subtitleSettings.screenSharedEnabled && Platform.isWindows) {
    //       result = await Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const SharedWithSubtitlesScreen(),
    //         ),
    //       );
    //     }
    //     // 2) 자막 only 화면 전환
    //     else {
    //       result = await Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder:
    //               (context) => SubtitlesOnlyScreen(
    //             subWordFont: "default",
    //             backgroundColor: Colors.black,
    //             subSpacing: 20,
    //           ),
    //         ),
    //       );
    //     }
    //
    //     // [UI UPDATE] UI 화면 갱신
    //     // (Close 버튼 클릭으로 true를 받았을 때)
    //     if (result == true) {
    //       debugPrint("[UI UPDATE] Close 버튼 클릭 -> 녹음 일시 정지");
    //       TimerManager.pause(); // 타이머 일시 정지
    //       setState(() {});
    //     }
    //   }
    // }
    // // 2) 일시 정지 상태일 때
    // else {
    //   TimerManager.pause(); // 타이머 일시정지
    //   final service = currentService;
    //   await service.stopRecording();
    //   debugPrint('일시정지');
    // }
  }

  // [2] 취소 -> 타이머 리셋
  void _handleCancel() {
    // final service = currentService; // 현재 활성화된 STT/MultipleSTT 서비스 인스턴스를 가져옵니다.
    //
    // // 1) 서버 연결 종료 및 데이터 초기화
    // service.resetReconnectState(); // 재연결 상태 초기화
    // service.clearAllData(); // 누적된 모든 데이터 (텍스트 기록 등) 초기화
    // service.disconnect(); // WebSocket 연결 끊기
    //
    // // 2) 타이머 및 UI 상태 초기화
    // TimerManager.reset(); // 타이머를 0으로 리셋
    // setState(() {
    //   hasStarted = false; // UI의 '시작됨' 상태를 리셋합니다.
    // });
    //
    // debugPrint('[DEBUG] _handleCancel() - 취소 및 서비스 연결 해제 완료');
  }

  // [3] 종료 -> 다이얼로그 창    // 일시 비활성화
  void _handleStop() async {
    // final service = currentService;
    //
    // // 1) 자막 결과 및 통계 로그 출력
    // final transcriptHistory = service.transcriptHistory;
    // final translationHistory = service.translationHistory;
    // final fullTranscript = service.fullTranscriptText;
    //
    // debugPrint("강의 요약:");
    // debugPrint("  - 총 원문 개수: ${transcriptHistory.length}");
    // debugPrint("  - 총 번역 개수: ${translationHistory.length}");
    // debugPrint("  - 전체 원문 길이: ${fullTranscript.length}자");
    //
    // if (fullTranscript.isNotEmpty) {
    //   final sample =
    //   fullTranscript.length > 200
    //       ? "${fullTranscript.substring(0, 200)}..."
    //       : fullTranscript;
    //   debugPrint("  - 원문 샘플: $sample");
    // }
    //
    // // 2) 재연결 관련 변수 초기화
    // service.resetReconnectState();
    // service.clearAllData();
    // service.disconnect();
    //
    // // 3) 타이머 삭제
    // TimerManager.reset();
    // debugPrint('[DEBUG] _handelStop() - 강의 종료');
    // setState(() {
    //   hasStarted = false;
    // });
    //
    // _navigateToSaveDialog(
    //   transcriptHistory,
    //   translationHistory,
    //   fullTranscript,
    // );
  }

}
