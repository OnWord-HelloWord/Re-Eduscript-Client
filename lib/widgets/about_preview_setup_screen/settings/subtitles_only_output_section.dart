// [widgets/about_preview_setup_screen/settings/screen_shared_status_section.dart]
// [대기화면 -> 자막 스타일 설정 -> 출력 언어 섹션 (화면 공유 OFF)]

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/core/constants/app_titles.dart'; // [cores] 타이틀
import 'package:re_eduscript_client/core/constants/app_languages.dart'; // [core] 사용 가능한 언어
import 'package:re_eduscript_client/providers/language_settings_provider.dart'; // [providers] 언어 설정
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/set_section_title.dart';             // [widgets] 제목 지정
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/settings_background_container.dart'; // [widgets] 배경 컨테이너
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/setting_item_wrapper.dart';          // [widgets] 이름 + 드롭다운 랩퍼
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/section_divider.dart';               // [widgets] 구분선
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/language_selection_dropdown.dart';    // [widgets] 드롭다운
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/vertical_position_dropdown.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/font_size_dropdown.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/font_color_dropdown.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/font_background_color_dropdown.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/font_background_opacity_dropdown.dart';

import 'components/set_sub_section_wrapper.dart';

class SubtitlesOnlyOutputSection extends StatelessWidget {
  const SubtitlesOnlyOutputSection({super.key});

  @override
  Widget build(BuildContext context) {
    // [provider] 선택된 언어 리스트 받아오기
    final languages = context.read<LanguageSettingsProvider>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
        children: [
          // 1) 섹션 타이틀 (-> 자막 설정)
          SetSectionTitle(title: AppTitles.subtitleSectionTitle),
          SizedBox(height: 10),
          // 2) 배경 컨테이너
          SettingsBackgroundContainer(
            child: Column(
              children: [
                // 출력 자막 언어
                SettingItemWrapper(
                  child: LanguageSelectionDropdown(
                    selectedLanguages: languages.selectedOutputLanguages, // 선택된 언어 리스트
                    availableLanguages: AppLanguages.languageOptions,     // 선택 가능한 언어 리스트
                    onChanged: (List<String> newLanguages) {              // 출력 언어 업데이트
                      languages.updateOutputLanguages(newLanguages);
                    },
                    isInputLanguage: false, // 출력 언어일 때
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                ),
                const SizedBox(height: 20),

                // 자막 스타일 섹션
                SetSubSectionWrapper(
                  title: AppTitles.styleSubSectionTitle, // 서브 섹션 타이틀
                  content: Column(
                    children: [
                      // 드롭다운
                      SettingItemWrapper(child: VerticalPositionDropdown()),
                      const SectionDivider(), // 구분선
                      SettingItemWrapper(child: FontSizeDropdown()),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 자막 텍스트 섹션
                SetSubSectionWrapper(
                  title: AppTitles.textSubSectionTitle, // 서브 섹션 타이틀
                  content: Column(
                    children: [
                      // 드롭다운
                      SettingItemWrapper(child: FontSizeDropdown()),
                      const SectionDivider(), // 구분선
                      SettingItemWrapper(child: FontColorDropdown()),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 자막 배경 섹션
                SetSubSectionWrapper(
                  title: AppTitles.backgroundSubSectionTitle, // 서브 섹션 타이틀
                  content: Column(
                    children: [
                      // 드롭다운
                      SettingItemWrapper(child: FontBackgroundColorDropdown()),
                      const SectionDivider(), // 구분선
                      SettingItemWrapper(child: FontBackgroundOpacityDropdown()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]
    );
  }
}
