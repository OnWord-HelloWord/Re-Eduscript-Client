// [lib/widgets/about_preview_setup_screen/settings/settings_screen_shared_content.dart]
// [자막 설정] 화면 공유 ON 상태

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/screen_shared_section/screen_shared_input_section.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/screen_shared_section/screen_shared_output_section.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/screen_shared_section/screen_shared_status_section.dart';

class SettingsScreenSharedContent extends StatefulWidget {
  const SettingsScreenSharedContent({super.key});

  @override
  State<SettingsScreenSharedContent> createState() => _SettingsScreenSharedContentState();
}

class _SettingsScreenSharedContentState extends State<SettingsScreenSharedContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            ScreenSharedStatusSection(), // [1] 화면 공유 설정 섹션
            SizedBox(height: 30),
            ScreenSharedInputSection(),  // [2] 입력 언어 설정 섹션
            SizedBox(height: 25),
            ScreenSharedOutputSection()  // [3] 출력 언어 설정 섹션
          ]
      ),
    );
  }
}