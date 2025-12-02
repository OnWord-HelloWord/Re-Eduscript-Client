// [lib/core/styles/app_sizes.dart]
// 앱 크기 및 여백 관리

import 'package:flutter/material.dart';

class AppSizes {
  // 화면 최소창 크기
  static const double minScreenWidth = 1180.0;
  static const double minScreenHeight = 620.0;

  // 폰트 크기
  static const double baseFont = 14.0;        // 기본 폰트 크기
  static const double titleFontSize = 18.0;   // 제목 폰트 크기
  static const double largeFontSize = 40.0;   //
  static const double smallFontSize = 12.0;   // [providers] 자막 설정에 사용
  static const double timerFontSize = 50.0;   // 타이머 폰트 크기

  // 패딩, 마진 (여백)
  static const double basePadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;

  // 아이콘 크기
  // static const double baseIconSize = 24.0;
  // static const double smallIconSize = 16.0;
  // static const double mediumIconSize = 50.0;
  // static const double largeIconSize = 100.0;

  // 컨테이너 둥글기
  static const double baseRadius = 8.0;                 // (PreviewSection)
  // static const double largeRadius = 12.0;

  // < 시작 화면 >
  // [폰트]
  static const double startTitleFontSize = 110.0;      // 제목
  static const double startSubTitleFontSize = 25.0;    // 소제목
  static const double startTitleSpacing = 2.0;         // 제목 글 간격
  static const double startSubTitleSpacing = 0.5;      // 소제목 글 간격

  // [버튼] 시작 버튼
  static const double startButtonWidth = 200.0;         // 너비
  static const double startButtonElevation = 8.0;       // 입체감
  static const double startButtonSpacing = 1.0;         // 글 간격

  // [버튼] 모드 선택 버튼
  static const double modeButtonWidth = 220.0;          // 너비
  static const double modeButtonElevation = 6.0;        // 입체감
  static const double modeButtonSpacing = 0.5;          // 글 간격

  // [버튼] 공통 스타일 (시작 & 모드)
  static const double baseButtonHeight = 50.0;          // 높이
  static const double baseButtonFontSize = 30.0;        // 폰트 크기
  static const BorderRadius baseButtonRadius = const BorderRadius.all(Radius.circular(0.0));  // 둥글기

  // < 대기 화면 >
  static const double previewTitleSize = 18.0;          // 제목 크기
  static const double previewIconSize = 20.0;           // 아이콘 크기

}