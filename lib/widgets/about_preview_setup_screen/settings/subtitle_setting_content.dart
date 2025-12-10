// [widgets/about_preview_setup_screen/settings/subtitle_setting_content.dart]
// [자막 설정] 섹션 불러오기 (화면 공유, 입력, 출력 언어 섹션)

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/subtitle_input_section.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/screen_shared_output_section.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/screen_shared_status_section.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/subtitles_only_output_section.dart';

import '../../../providers/subtitle_style_provider.dart'; // [providers] 화면 공유 상태

class SubtitleSettingContent extends StatefulWidget {
  const SubtitleSettingContent({super.key});

  @override
  State<SubtitleSettingContent> createState() => _SubtitleSettingContentState();
}

class _SubtitleSettingContentState extends State<SubtitleSettingContent> {
  // [provider] 화면 공유 상태 받아오기
  late final style = context.watch<SubtitleStyleProvider>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            ScreenSharedStatusSection(), // [1] 화면 공유 설정 섹션
            SizedBox(height: 30),
            SubtitleInputSection(),  // [2] 입력 언어 설정 섹션
            SizedBox(height: 25),
            style.screenSharedEnabled  // [3] 출력 언어 설정 섹션
                ? ScreenSharedOutputSection()  // - 화면 공유 ON
                : SubtitlesOnlyOutputSection() // - 화면 공유 OFF
          ]
      ),
    );
  }
}