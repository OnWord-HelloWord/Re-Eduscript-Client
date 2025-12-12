// [lib/widgets/about_preview_setup_screen/playbar/play_pause_button_widget.dart]
// [플레이바 -  재생 버튼 위젯]

import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';

class PlayPauseButtonWidget extends StatelessWidget {
  final IconData icon;      // 버튼 아이콘
  final Color backgroundColor; // 버튼 배경 색상
  final double screenWidth; // 버튼 너비
  final VoidCallback onTap; // 버튼 클릭 시 이벤트

  const PlayPauseButtonWidget({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.screenWidth,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // [반응형]
    final double sizeRatio = 0.05;
    final double buttonSize = screenWidth * sizeRatio;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonSize,
        height: buttonSize, // 버튼 크기
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), // 둥글기
          color:
          AppColors.blueLightColor,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // 더 연한 그림자
              blurRadius: 10,
              spreadRadius: 1, // 그림자 확산
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.white, // 아이콘 흰색
          size: buttonSize * 0.8,
        ),
      ),
    );
  }
}
