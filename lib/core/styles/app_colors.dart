// [lib/core/styles/app_colors.dart]
// 앱 색상 관리

import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors {
  // 배경색
  static const Color whiteColor = Color(0xFFFFFFFF);     // 흰색
  static const Color whiteLightColor = Color(0xFFF3F4F6);     // 살짝 밝은 흰색
  static const Color navyColor = Color(0xFF111827);      // 딥 네이비

  // 폰트색
  static const Color blackFontColor = Color(0xFF000000);  // 검정색
  static const Color greyFontColor = Color(0xFF7C7C7C);   // (소제목) 회색

  // 파란색
  static const Color blueColor = Color(0xFF0075FF);    // (기본) 파란색
  static const Color blueLightColor = Color(0xFF2196F3);     // (버튼) 살짝 연한 파란색

  // 빨간색
  //static const Color redColor = Color(0xFFEF4444);

  // 초록색
  //static const Color greenColor = Color(0xFF45CE78);

  // 회색
  //static const Color greyColor = Color(0xFF7C7C7C);
  static const Color greyDividerColor = Color(0xFF707070); // 회색 구분석
  
  // [버튼] 시작, 모드 선택
  static const Color buttonShadowColor = Colors.black26; // (버튼) 그림자 색
}