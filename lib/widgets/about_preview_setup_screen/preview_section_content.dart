// [lib/widgets/about_preview_setup_screen/preview_section_content.dart]
// [대기 화면 -> 섹션 별 콘텐트 호출]

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/core/constants/app_enums.dart';
import 'package:re_eduscript_client/providers/subtitle_style_provider.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/playbar/playbar_content.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/preview/preview_screen_content.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/preview/preview_screen_shared_content.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/preview/preview_subtitle_only_content.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/subtitle_setting_content.dart';

class PreviewSectionContent extends StatelessWidget {
  final PreviewSectionType sectionType;
  final double screenWidth;
  final double screenHeight;

  const PreviewSectionContent({
    super.key,
    required this.sectionType,
    required this.screenWidth,
    required this.screenHeight
  });

  @override
  Widget build(BuildContext context) {
    // [Provider] 화면 공유 상태 받기
    // read가 아닌 watch로 불러와야 Provider의 상태 변화를 바로 감지함
    final subtitleStyle = context.watch<SubtitleStyleProvider>();

    switch (sectionType) {
      // [1] 미리보기 화면 섹션
      case PreviewSectionType.preview:
        return PreviewScreenContent();

      // [2] 플레이바 (재생 버튼) 섹션
      case PreviewSectionType.playbar:
        return PlaybarContent();

      // [3] 자막 설정 화면
      case PreviewSectionType.settings:
        return SubtitleSettingContent();
    }
  }
}
