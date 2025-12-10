// [lib/widgets/about_preview_setup_screen/preview/preview_screen_content.dart]
// [대기 화면 -> 미리보기 화면 (공통)]

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/providers/subtitle_style_provider.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/preview/preview_screen_shared_content.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/preview/preview_subtitle_only_content.dart';

import '../../../providers/language_mapping_provider.dart';
import '../../../providers/language_settings_provider.dart';

class PreviewScreenContent extends StatelessWidget {

  const PreviewScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // [Provider] 화면 공유 상태, 자막 스타일 등 받아오기
    final language = context.watch<LanguageSettingsProvider>();
    final mapping = context.watch<LanguageMappingProvider>();
    final styles = context.watch<SubtitleStyleProvider>();

    final languages = language.selectedOutputLanguages;  // 선택된 출력 언어
    const double referenceScreenWidth = 800.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        // [반응형]
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        final double scaleFactor = screenWidth / referenceScreenWidth;

        // - 화면 공유 ON
        if (styles.screenSharedEnabled) {
          return PreviewScreenSharedContent(
            languages: languages,
            mapping: mapping,
            styles: styles,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            scaleFactor: scaleFactor,
          );
        }
        // - 화면 공유 OFF
        else {
          return PreviewSubtitleOnlyContent(
            languages: languages,
            mapping: mapping,
            styles: styles,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            scaleFactor: scaleFactor,
          );
        }
      },
    );
  }
}
