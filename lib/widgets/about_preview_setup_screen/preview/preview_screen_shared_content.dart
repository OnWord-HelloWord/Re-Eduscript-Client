// [lib/widgets/about_preview_setup_screen/preview/preview_screen_shared_content.dart]
// [화면 미리보기] 화면 공유 ON 상태

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/providers/language_settings_provider.dart'; // [provider] 선택된 언어
import 'package:re_eduscript_client/providers/language_mapping_provider.dart';  // [provider] 국가별 언어 매핑
import 'package:re_eduscript_client/providers/subtitle_style_provider.dart';    // [provider] 자막 스타일

class PreviewScreenSharedContent extends StatelessWidget {
  const PreviewScreenSharedContent({super.key});

  @override
  Widget build(BuildContext context) {
    // [provider] 선택된 언어, 자막 스타일 불러오기
    final language = context.watch<LanguageSettingsProvider>(); // 입출력 언어 관리
    final mapping = context.watch<LanguageMappingProvider>();   // 국가별 언어 매핑 관리
    final styles = context.watch<SubtitleStyleProvider>();      // 자막 스타일 관리

    final languages = language.selectedOutputLanguages;         // 선택된 출력 언어
    const double referenceScreenWidth = 800.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        // [반응형]
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        final double scaleFactor = screenWidth / referenceScreenWidth;

        return Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue[200]!, Colors.purple[100]!], // 배경색 (그라데이션 -> 예시 바탕화면)
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 0.05 * screenWidth,
            vertical: 20 * scaleFactor,
          ),
          // 자막 설정
          child: Column(
            mainAxisAlignment: styles.getAlignment(),            // [providers] 자막 세로 위치 (style)
            crossAxisAlignment: styles.getHorizontalAlignment(), // [providers] 자막 가로 위치 (style)
            children: [
              for (int i = 0; i < languages.length; i++)         // 자막 갯수 제한 !!!!!! (나중에)
                Padding(
                  padding: EdgeInsets.only(bottom: 10 * scaleFactor),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10 * scaleFactor,
                      vertical: 7 * scaleFactor,
                    ),
                    constraints: BoxConstraints(
                      maxWidth: screenWidth * 0.95,
                      maxHeight: screenHeight * 0.2,
                    ),
                    // 최대 자막 컨테이너 높이
                    decoration: BoxDecoration(
                      color: Colors.black,                  // 자막 배경 색상 (검정색 고정)
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      mapping.getPreviewText(languages[i]), // [providers] 자막 내용 지정 (languages)
                      textAlign: TextAlign.left,            // 자막 왼쪽 정렬
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: styles.getFontSize(screenWidth) * scaleFactor, // [providers] 폰트 사이즈 (style)
                        fontStyle: styles.getFontStyle(),  // [providers] 폰트 이탤릭 (style)
                        height: 1.2,
                        textBaseline: null,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}