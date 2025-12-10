// [lib/widgets/about_preview_setup_screen/preview/preview_subtitle_only_content.dart]
// [화면 미리보기] 화면 공유 OFF 상태

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/core/styles/app_colors.dart'; // [cores] 색상
import 'package:re_eduscript_client/core/styles/app_sizes.dart';

class PreviewSubtitleOnlyContent extends StatelessWidget {
  final List<String> languages;
  final dynamic mapping; // LanguageMappingProvider 인스턴스 타입 지정
  final dynamic styles;  // SubtitleStyleProvider 인스턴스 타입 지정
  final double screenWidth;
  final double screenHeight;
  final double scaleFactor;

  const PreviewSubtitleOnlyContent({
    super.key,
    required this.languages,
    required this.mapping,
    required this.styles,
    required this.screenWidth,
    required this.screenHeight,
    required this.scaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      // 1) 배경색 지정 (네이비)
      decoration: BoxDecoration(
        color: AppColors.navyColor,
        borderRadius: BorderRadius.circular(AppSizes.baseRadius),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10 * scaleFactor,
        vertical: 20 * scaleFactor,
      ),
      // 2) 자막 미리보기 설정
      child: Column(
        mainAxisAlignment: styles.getAlignment(),     // [providers] 자막 세로 정렬 (style)
        children: [
          for (int i = 0; i < languages.length; i++)  // 자막 갯수 제한 !!!!!! (나중에)
            Column(
              children: [
                // - 자막 간 간격 지정
                SizedBox(height: 15 * scaleFactor),
                // - 자막 컨테이너
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10 * scaleFactor,
                    vertical: 7 * scaleFactor,
                  ),
                  // 컨테이너 크기 지정
                  width: screenWidth * 0.95,
                  constraints: BoxConstraints(
                    maxHeight: screenHeight * 0.2, // 최대 자막 컨테이너 높이
                  ),
                  // 컨테이너 배경색, 둥글기
                  decoration: BoxDecoration(
                    color: styles.getBackgroundColor().withValues(
                      alpha:
                      styles.getBackgroundOpacity(), // [providers] 폰트 배경색 불투명도 (style)
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  // 자막 텍스트
                  child: Text(
                    mapping.getPreviewText(languages[i]), // [providers] 자막 미리보기 내용 (languages)
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: styles.getFontColor(),       // [providers] 폰트 색상 (style)
                      fontSize: styles.getFontSize(screenWidth) * scaleFactor, // [providers] 폰트 사이즈 (style)
                      fontWeight: styles.getFontWeight(), // [providers] 폰트 볼드 (style)
                      fontStyle: styles.getFontStyle(),   // [providers] 폰트 이탤릭 (style)
                      textBaseline: null,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}