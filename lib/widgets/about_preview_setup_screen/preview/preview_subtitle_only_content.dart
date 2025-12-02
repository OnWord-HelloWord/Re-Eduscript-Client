// [lib/widgets/about_preview_setup_screen/preview/preview_subtitle_only_content.dart]
// [화면 미리보기] 화면 공유 OFF 상태

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/core/styles/app_colors.dart'; // [cores] 색상
import 'package:re_eduscript_client/core/styles/app_sizes.dart';
import 'package:re_eduscript_client/providers/language_mapping_provider.dart';
import 'package:re_eduscript_client/providers/language_settings_provider.dart';
import 'package:re_eduscript_client/providers/subtitle_style_provider.dart';

class PreviewSubtitleOnlyContent extends StatelessWidget {
  const PreviewSubtitleOnlyContent({super.key});

  @override
  Widget build(BuildContext context) {
    // [Provider]
    final language = context.watch<LanguageSettingsProvider>();  // 입출력 언어 관리
    final mapping = context.watch<LanguageMappingProvider>();    // 국가별 언어 매핑 관리
    final styles = context.watch<SubtitleStyleProvider>();       // 자막 스타일 관리


    final languages = language.selectedOutputLanguages;  // 선택된 출력 언어
    const double referenceScreenWidth = 800.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        // [반응형]
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        final double scaleFactor = screenWidth / referenceScreenWidth; // 크기 조정

        return Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            color: AppColors.navyColor, // 배경색
            borderRadius: BorderRadius.circular(AppSizes.baseRadius), // 둥글기
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10 * scaleFactor,
            vertical: 20 * scaleFactor,
          ),
          child: Column(
            mainAxisAlignment: styles.getAlignment(),     // [providers] 자막 위치 (style)
            children: [
              for (int i = 0; i < languages.length; i++)  // 자막 갯수 제한 !!!!!!
                Column(
                  children: [
                    SizedBox(height: 15 * scaleFactor),   // 자막 간 간격 지정
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10 * scaleFactor,
                        vertical: 7 * scaleFactor,
                      ),
                      width: screenWidth * 0.95,
                      constraints: BoxConstraints(
                        maxHeight: screenHeight * 0.2,
                      ),
                      // 최대 자막 컨테이너 높이
                      decoration: BoxDecoration(
                        color: styles.getBackgroundColor().withValues(
                          alpha:
                          styles.getBackgroundOpacity(), // [providers] 폰트 배경색 불투명도 (style)
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        mapping.getPreviewText(languages[i]), // [providers] 자막 내용 지정 (languages)
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
                    SizedBox(height: 15 * scaleFactor),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}