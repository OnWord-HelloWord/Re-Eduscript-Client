// [lib/widgets/about_preview_setup_screen/preview/preview_screen_shared_content.dart]
// [화면 미리보기] 화면 공유 ON 상태

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/core/styles/app_sizes.dart';

class PreviewScreenSharedContent extends StatelessWidget {
  final List<String> languages;
  final dynamic mapping; // LanguageMappingProvider 인스턴스 타입 지정
  final dynamic styles;  // SubtitleStyleProvider 인스턴스 타입 지정
  final double screenWidth;
  final double screenHeight;
  final double scaleFactor;

  const PreviewScreenSharedContent({
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
      // 1) 배경색 지정 (그라데이션 -> 예시 바탕화면)
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue[200]!, Colors.purple[100]!],
        ),
        borderRadius: BorderRadius.circular(AppSizes.baseRadius),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 0.05 * screenWidth,
        vertical: 20 * scaleFactor,
      ),
      // 2) 자막 미리보기 설정
      child: Column(
        mainAxisAlignment: styles.getAlignment(),            // [providers] 자막 세로 위치 (style)
        crossAxisAlignment: styles.getHorizontalAlignment(), // [providers] 자막 가로 위치 (style)
        children: [
          for (int i = 0; i < languages.length; i++)         // 자막 갯수 제한 !!!!!! (나중에)
            Padding(
              // - 자막 간 간격 지정
              padding: EdgeInsets.only(bottom: 10 * scaleFactor),
              // - 자막 컨테이너
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10 * scaleFactor,
                  vertical: 7 * scaleFactor,
                ),
                // 최대 자막 컨테이너 크기 지정
                constraints: BoxConstraints(
                  maxWidth: screenWidth * 0.95,
                  maxHeight: screenHeight * 0.2,
                ),
                // 컨테이너 배경색 지정
                decoration: BoxDecoration(
                  color: Colors.black,  // 자막 배경 색상 (검정색 고정)
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  mapping.getPreviewText(languages[i]), // [providers] 자막 미리보기 내용 (languages)
                  textAlign: TextAlign.left, // 자막 왼쪽 정렬
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: styles.getFontSize(screenWidth) * scaleFactor, // [providers] 폰트 사이즈 (style)
                    height: 1.2,
                    textBaseline: null,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}