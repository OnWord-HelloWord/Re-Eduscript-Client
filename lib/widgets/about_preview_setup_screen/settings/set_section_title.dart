// []
// [settings] 섹션 타이틀

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/core/styles/app_colors.dart';    // [cores] 색상
import 'package:re_eduscript_client/core/styles/app_sizes.dart';     // [cores] 사이즈
import 'package:re_eduscript_client/core/constants/app_titles.dart'; // [cores] 타이틀

class SetSectionTitle extends StatelessWidget {
  final String title; // 섹션 제목

  const SetSectionTitle({
    super.key,
    required this.title
  });

  // 섹션 제목  별 아이콘
  IconData _getSectionIcon(String title) {
    switch (title) {
      case AppTitles.screenShareSectionTitle:   // 화면 공유 OFF/ON
        return Icons.screen_share;
      case AppTitles.inputLanguageSectionTitle: // 인식 언어 설정
        return Icons.mic;
      case AppTitles.subtitleSectionTitle:      // 자막 설정
        return Icons.subtitles;
      default:
        return Icons.settings;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(_getSectionIcon(title), color: AppColors.blueLightColor, size: 20),
        SizedBox(width: 8),
        Text(
          title,  // 섹션 제목 지정
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppSizes.titleFontSize,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
