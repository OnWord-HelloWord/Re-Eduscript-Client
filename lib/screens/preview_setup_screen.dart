// [lib/screens/preview_setup_screen.dart]
// [screen] 대기 화면 뼈대 구성
// 1) 왼쪽 영역 : [1] 화면 미리보기, [2] 재생 버튼
// 2) 오른쪽 영역 : [3] 자막 설정

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/core/constants/app_enums.dart'; // [core] 이넘 (preview)
import 'package:re_eduscript_client/core/styles/app_colors.dart'; // [core] 색상
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/preview_section.dart'; // [widgets]

class PreviewSetupScreen extends StatelessWidget {
  const PreviewSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // [화면 크기 정보]
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: AppColors.whiteLightColor,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.015), // 화면 너비의 1.5%
        child: Row(
          children: [
            // 1) 왼쪽 영역 (화면 미리보기, 재생 버튼)
            Expanded(
              flex: 7, // 전체의 70%
              child: Column(
                children: [
                  // [1] 화면 미리보기
                  Expanded(
                      flex: 8,
                      child: PreviewSection(
                        sectionType: PreviewSectionType.preview, // 섹션 타입 전달
                      )
                  ),
                  SizedBox(height: 18), // 여백
                  // [2] 재생 버튼
                  Expanded(
                      flex: 2,
                      child: PreviewSection(
                        sectionType: PreviewSectionType.playbar,  // 섹션 타입 전달
                      )
                  ),
                ],
              ),
            ),
            SizedBox( // 구분선
              height: screenHeight * 0.98, // 세로 길이
              child: VerticalDivider(
                color: AppColors.greyDividerColor,
                thickness: 2.0,
                width: screenWidth * 0.04, // 선+좌우 간격 포함한 너비
              ),
            ),
            // 2) 오른쪽 영역 (자막 설정)
            Expanded(
              flex: 3, // 전체의 30%
              child: PreviewSection(
                sectionType: PreviewSectionType.settings, // 섹션 타입 전달
              ),
            ),
          ],
        ),
      ),
    );
  }
}
