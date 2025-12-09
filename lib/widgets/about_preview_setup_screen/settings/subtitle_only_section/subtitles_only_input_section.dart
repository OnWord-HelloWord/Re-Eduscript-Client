// []
// [대기화면 -> 자막 스타일 -> 입력 언어 섹션]

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/core/constants/app_titles.dart'; // [cores] 타이틀
import 'package:re_eduscript_client/core/constants/app_languages.dart'; // [core] 사용 가능한 언어
import 'package:re_eduscript_client/providers/language_settings_provider.dart'; // [providers] 언어 설정
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/set_section_title.dart';             // [widgets] 제목 지정
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/settings_background_container.dart'; // [widgets] 배경 컨테이너
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/setting_item_wrapper.dart';          // [widgets] 이름 + 드롭다운 랩퍼
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/language_selection_dropdown.dart';    // [widgets] 드롭다운

class SubtitlesOnlyInputSection extends StatelessWidget {
  const SubtitlesOnlyInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    // [provider] 선택된 언어 리스트 받아오기
    final languages = context.read<LanguageSettingsProvider>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
        children: [
          // 1) 섹션 타이틀 (-> 인식 언어 설정)
          SetSectionTitle(title: AppTitles.inputLanguageSectionTitle),
          const SizedBox(height: 10),
          // 2) 배경 컨테이너
          SettingsBackgroundContainer(
            // -> 컨테이너 (이름 + 드롭다운 위젯)
            child: SettingItemWrapper(
              // -> 언어 선택 드롭다운
              child: LanguageSelectionDropdown(
                selectedLanguages: languages.selectedInputLanguages, // 선택된 언어 리스트
                availableLanguages: AppLanguages.languageOptions,    // 선택 가능한 언어 리스트
                onChanged: (List<String> newLanguages) {             // 인식 언어 업데이트
                  languages.updateInputLanguages(newLanguages);
                },
                isInputLanguage: true, // 입력 언어일 때
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
            ),
          ),
        ]
    );
  }
}
