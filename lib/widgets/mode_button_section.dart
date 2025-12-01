// [lib/widgets/mode_button_section.dart]
// 시작, 모드 선택 버튼 섹션

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:re_eduscript_client/widgets/app_elevated_button.dart';

import '../core/constants/app_enums.dart';      // [이넘] 모드
import '../core/styles/app_sizes.dart';         // [이넘] 크기

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
            letterSpacing: AppSizes.startButtonLetterSpacing),
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
              letterSpacing: AppSizes.modeButtonLetterSpacing),
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
              letterSpacing: AppSizes.modeButtonLetterSpacing),
        ),
      ],
    );
  }
}
