// [lib/widgets/about_preview_setup_screen/preview_scection.dart]
// [대기 화면 -> 제목 영역 + 블록 영역]

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/core/constants/app_enums.dart'; // [cores] 섹션 타입
import 'package:re_eduscript_client/core/styles/app_colors.dart';   // [cores] 색상
import 'package:re_eduscript_client/core/styles/app_sizes.dart';    // [cores] 사이즈
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/preview_section_content.dart';  // [sections] PreviewSectionContent

class PreviewSection extends StatelessWidget {
  final PreviewSectionType sectionType; // 섹션 타입

  const PreviewSection({
    super.key,
    required this.sectionType,
  });

  @override
  Widget build(BuildContext context) {
    // [현재 위젯 크기 정보]
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // 제목 지정
    String titleText = switch (sectionType) {
      PreviewSectionType.preview => '화면 미리보기',
      PreviewSectionType.playbar => '',
      PreviewSectionType.settings => '',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // [1] 제목 표시 (ex. 미리보기 화면)
        // -> 제목(titleText)이 있을 경우에 제목 표시
        if(titleText.isNotEmpty)...[
          Padding(
            padding: EdgeInsets.only(left: 1, bottom: screenHeight * 0.01),
            child: Row(
              children: [
                Icon(
                  Icons.desktop_windows,
                  color: AppColors.blueLightColor,
                  size: AppSizes.previewIconSize,
                ),
                SizedBox(width: 8),
                Text(
                  titleText,
                  style: TextStyle(
                    color: AppColors.blackFontColor,
                    fontSize: AppSizes.previewTitleSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
        // [2] 블록 영역
        Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,  // 연한 회색
                borderRadius: BorderRadius.circular(
                  AppSizes.baseRadius
                ),
                border: Border.all(color: Colors.transparent),
              ),
              child: PreviewSectionContent( // (호출) 섹션 별 컨텐트
                sectionType: sectionType,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
            ),
        )
      ],
    );
  }
}
