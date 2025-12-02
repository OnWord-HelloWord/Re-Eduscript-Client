// [lib/widgets/about_start_screen/app_elevated_button.dart]
// 시작, 모드 선택 버튼 위젯

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/core/styles/app_colors.dart'; // [core] 색상
import 'package:re_eduscript_client/core/styles/app_sizes.dart';  // [core] 사이즈

class AppElevatedButton extends StatelessWidget {
  // [상태 변수]
  final VoidCallback onPressed; // 버튼 클릭
  final String text;            // 제목
  final double width;           // 너비
  final double elevation;       // 입체감
  final double letterSpacing;   // 글 간격
  final IconData? icon;         // 버튼 아이콘

  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.width,
    required this.elevation,
    required this.letterSpacing,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // [공통 스타일]
    // 1) 버튼 디자인
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: AppColors.blueLightColor, // 배경색
      foregroundColor: AppColors.whiteColor,      // 폰트색
      shadowColor: AppColors.buttonShadowColor,   // 그림자
      shape: RoundedRectangleBorder(
        borderRadius: AppSizes.baseButtonRadius,  // 둥글기
      ),
    );

    // 2) 버튼 내 폰트
    final TextStyle textStyle = TextStyle(
      fontSize: AppSizes.baseButtonFontSize,      // 폰트 크기
      fontWeight: FontWeight.w600,                // 폰트 굵기
    );

    // 3) 버튼 아이콘
    final Widget buttonContent = icon != null
      // 3-1) 모드 선택 버튼 (강의, 토론)
      ? ElevatedButton.icon(
        onPressed: onPressed,
        style: buttonStyle,                   // 버튼 스타일
        icon: Icon(icon, size: 38),           // 아이콘
        label: Text(text, style: textStyle),  // 텍스트 스타일
      )
      // 3-2) 시작 버튼
      : ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,                   // 버튼 스타일
        child: Text(text, style: textStyle),  // 텍스트 스타일
      );

    return Container(
      width: width,
      height: AppSizes.baseButtonHeight,
      child: buttonContent,
    );
  }
}
