// [lib/widgets/about_preview_setup_screen/settings/settings_subtitle_only_content.dart]
// [자막 설정] 화면 공유 OFF 상태 -> 섹션 (화면 공유, 인식 언어, 자막 설정)

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/subtitle_only_section/subtitles_only_status_section.dart'; // [1] 화면 공유 설정 섹션
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/subtitle_only_section/subtitles_only_input_section.dart'; // [2] 입력 언어 설정 섹션
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/subtitle_only_section/subtitles_only_output_section.dart';  // [3] 출력 언어 설정 섹션

class SettingsSubtitleOnlyContent extends StatefulWidget {

  const SettingsSubtitleOnlyContent({
    super.key,
  });

  @override
  State<SettingsSubtitleOnlyContent> createState() => _SettingsSubtitleOnlyContentState();
}

class _SettingsSubtitleOnlyContentState extends State<SettingsSubtitleOnlyContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SubtitleOnlyStatusSection(), // [1] 화면 공유 설정 섹션
          SizedBox(height: 30),
          SubtitlesOnlyInputSection(),  // [2] 입력 언어 설정 섹션
          SizedBox(height: 25),
          SubtitlesOnlyOutputSection()  // [3] 출력 언어 설정 섹션
        ]
      ),
    );
  }
}