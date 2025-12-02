// [lib/widgets/about_start_screen/mode_button_section.dart]
// 시작, 모드 선택 버튼 섹션

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:re_eduscript_client/core/constants/app_enums.dart'; // [core] 모드
import 'package:re_eduscript_client/core/styles/app_sizes.dart';    // [core] 사이즈
import 'package:re_eduscript_client/widgets/about_start_screen/app_elevated_button.dart';  // [widgets] 버튼

class ModeButtonSection extends StatelessWidget {
  final bool showModeSelection;         // 모드 선택 여부
  final VoidCallback onStartPressed;    // 시작 버튼 클릭 후
  final Function(Mode) onModeSelected;  // 모드 선택 클릭 후

  const ModeButtonSection({
    super.key,
    required this.showModeSelection,
    required this.onStartPressed,
    required this.onModeSelected,
    });

  @override
  Widget build(BuildContext context) {
    // [현재 위젯 크기 정보]
    final Size screenSize = MediaQuery.of(context).size;  // 화면 사이즈
    final double screenWidth = screenSize.width;          // 화면 너비
    final double screenHeight = screenSize.height;        // 화면 높이

    return showModeSelection
      ? _buildModeSelection(screenWidth, screenHeight)  // [2] 모드 선택 버튼 섹션
      : _buildStartButton(screenWidth, screenHeight);   // [1] 시작 버튼 섹션
  }

  // [1] 시작하기 버튼
  Widget _buildStartButton(double screenWidth, double screenHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: AppElevatedButton(  // (호출) 버튼 위젯
            onPressed: onStartPressed,
            text: "시작하기",
            width: AppSizes.startButtonWidth,
            elevation: AppSizes.startButtonElevation,
            letterSpacing: AppSizes.startButtonSpacing),
        )
      ],
    );
  }

  // [2] 모드 선택 버튼
  Widget _buildModeSelection(double screenWidth, double screenHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 1) 강의 모드 버튼
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: AppElevatedButton(  // (호출) 버튼 위젯
              onPressed: () => onModeSelected(Mode.lecture),
              text: "강의 모드",
              width: AppSizes.modeButtonWidth,
              elevation: AppSizes.modeButtonElevation,
              icon: Icons.school,
              letterSpacing: AppSizes.modeButtonSpacing),
        ),

        SizedBox(height: 10),

        // 2) 토론 모드 버튼
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: AppElevatedButton( // (호출) 버튼 위젯
              onPressed: () => onModeSelected(Mode.conference),
              text: "토론 모드",
              width: AppSizes.modeButtonWidth,
              elevation: AppSizes.modeButtonElevation,
              icon: Icons.groups,
              letterSpacing: AppSizes.modeButtonSpacing),
        ),
      ],
    );
  }
}
