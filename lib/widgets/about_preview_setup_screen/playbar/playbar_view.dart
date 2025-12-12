// [lib/widgets/about_preview_setup_screen/playbar/playbar_view.dart]
// [플레이바 컨텐트 - 뼈대]

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/core/styles/app_colors.dart'; // [core] 색상
import 'package:re_eduscript_client/core/styles/app_sizes.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/playbar/play_pause_button_widget.dart';         // [core] 사이즈

class PlaybarView extends StatelessWidget {
  final double screenWidth;
  final bool isPlaying;           // 재생 중인지 여부
  final bool hasStarted;          // 이미 재생 중이었는지 여부
  final String displayTime;       // 재생 시간
  final VoidCallback onPlayPause; // 재생/정지 클릭 시
  final VoidCallback onCancel;    // 취소 클릭 시
  final VoidCallback onStop;      // 종료 클릭 시

  const PlaybarView({
    super.key,
    required this.screenWidth,
    required this.isPlaying,
    required this.hasStarted,
    required this.displayTime,
    required this.onPlayPause,
    required this.onCancel,
    required this.onStop
  });

  // [타이머 표시]
  Widget _displayTimer() {
    return Text(
      displayTime,
      style: TextStyle(
        fontSize: AppSizes.largeFontSize,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // [1] 배경
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.01,
        vertical: screenWidth * 0.01,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor, // 배경색
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // 더 연한 그림자
            blurRadius: 10,
            spreadRadius: 1, // 그림자 확산
            offset: Offset(0, 3),
          ),
        ],
      ),
      // [2] 버튼
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1) 취소 버튼
          if (hasStarted) ...[ // 재생 중일 때
            PlayPauseButtonWidget(
              icon: Icons.close,
              backgroundColor: AppColors.redColor,
              screenWidth: screenWidth,
              onTap: onCancel,
            ),
            SizedBox(width: screenWidth * 0.03),
          ],

          // 2) 재생/일시정지 버튼
          PlayPauseButtonWidget(
            icon: isPlaying ? Icons.pause : Icons.play_arrow,
            backgroundColor: AppColors.blueLightColor,
            onTap: onPlayPause,
            screenWidth: screenWidth,
          ),

          // 3) 종료 버튼 (재생이 시작된 후에는 항상 표시)
          if (hasStarted) ...[
            SizedBox(width: screenWidth * 0.03),
            PlayPauseButtonWidget(
              icon: Icons.stop,
              backgroundColor: AppColors.greenColor,
              onTap: onStop,
              screenWidth: screenWidth,
            ),
          ],

          SizedBox(width: screenWidth * 0.04),

          // [3] 타이머
          _displayTimer(),
        ],
      ),
    );
  }
}
