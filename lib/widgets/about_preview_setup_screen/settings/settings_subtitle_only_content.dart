// [lib/widgets/about_preview_setup_screen/settings/settings_subtitle_only_content.dart]
// [자막 설정] 화면 공유 OFF 상태 -> 섹션 (화면 공유, 인식 언어, 자막 설정)

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/core/constants/app_languages.dart';
import 'package:re_eduscript_client/core/constants/app_titles.dart'; // [cores] 타이틀
import 'package:re_eduscript_client/core/styles/app_sizes.dart';     // [cores] 사이즈
import 'package:re_eduscript_client/providers/language_settings_provider.dart'; // [providers] 언어 설정
import 'package:re_eduscript_client/providers/subtitle_style_provider.dart'; // [providers] 자막 스타일
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/section_divider.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/set_section_title.dart'; // [widgets] 제목 지정
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/settings_background_container.dart'; // [widgets] 배경 컨테이너
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/set_sub_section_wrapper.dart'; // [widgets] 배경 컨테이너
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/setting_item_wrapper.dart'; // [widgets] 래퍼 컨테이너
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/onoff_switch_widget.dart'; // [widgets] onoff 스위치
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/language_selection_dropdown.dart'; // [widgets] 드롭다운
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/vertical_position_dropdown.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/font_style_dropdown.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/font_size_dropdown.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/font_color_dropdown.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/font_background_color_dropdown.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/font_background_opacity_dropdown.dart';

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
    // [provider] 화면 공유 상태, 선택된 언어 리스트 받아오기
    final styles = context.watch<SubtitleStyleProvider>();
    final languages = context.read<LanguageSettingsProvider>();

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildScreenShareSection(styles),
          SizedBox(height: 30),
          _buildInputLanguageSection(languages),
          SizedBox(height: 25),
          _buildOutputLanguageSection(languages)
        ]
      ),
    );
  }

  // [1] 화면 공유 상태 섹션
  Widget _buildScreenShareSection(SubtitleStyleProvider styles) {
    return Column(
      children: [
        // 1) 섹션 타이틀 (-> 화면 공유)
        SetSectionTitle(title: AppTitles.screenShareSectionTitle),
        SizedBox(height: 10), // 여백
        // 2) 배경 컨테이너
        SettingsBackgroundContainer(
          child: Column(
            children: [
              SettingItemWrapper(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 이름
                    Text(
                      "화면 공유 OFF/ON",
                      style: TextStyle(
                        fontSize: AppSizes.baseFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    // 스위치 위젯
                    OnoffSwitch(
                      initialValue: styles.screenSharedEnabled,     // 초기 상태
                      onChanged: (bool newValue) {                    // 상태 변화 시 업데이트
                        styles.updateScreenShareedEnabled(newValue);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // [2] 입력 언어 설정 섹션
  Widget _buildInputLanguageSection(LanguageSettingsProvider languages) {
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

  // [3] 출력 언어 설정 섹션
  Widget _buildOutputLanguageSection(LanguageSettingsProvider languages) {
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
                      SettingItemWrapper(child: FontStyleDropdown()),
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