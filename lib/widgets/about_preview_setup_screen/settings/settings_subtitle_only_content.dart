// [lib/widgets/about_preview_setup_screen/settings/settings_subtitle_only_content.dart]
// [자막 설정] 화면 공유 OFF 상태 -> 섹션 (화면 공유, 인식 언어, 자막 설정)

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/core/constants/app_enums.dart';  // [cores] 모드
import 'package:re_eduscript_client/core/constants/app_languages.dart';
import 'package:re_eduscript_client/core/constants/app_titles.dart'; // [cores] 타이틀
import 'package:re_eduscript_client/core/styles/app_sizes.dart';     // [cores] 사이즈
import 'package:re_eduscript_client/providers/language_settings_provider.dart';
import 'package:re_eduscript_client/providers/mode_provider.dart';   // [providers] 모드
import 'package:re_eduscript_client/providers/subtitle_style_provider.dart'; // [providers] 모드
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/set_section_title.dart'; // [widgets] 제목 지정
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/language_selection_dropdown.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/settings_background_container.dart'; // [widgets] 배경 컨테이너
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/setting_item_wrapper.dart'; // [widgets] 래퍼 컨테이너
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/onoff_switch_widget.dart'; // [widgets] onoff 스위치

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
          this._buildScreenShareSection(styles),
          SizedBox(height: 30),
          this._buildInputLanguageSection(languages),
          SizedBox(height: 25),
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
              // 선택된 언어 리스트
              selectedLanguages: languages.selectedInputLanguages,
              // 선택 가능한 언어 리스트
              availableLanguages: AppLanguages.languageOptions,
              // 인식 언어 업데이트
              onChanged: (List<String> newLanguages) {
                languages.updateInputLanguages(newLanguages);
              },
              isSelected: true, // 인식 언어 선택 여부
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ),
        ),
      ]
    );
  }

  // [3] 출력 언어 설정 섹션
  // Widget _buildOutputLanguageSection(SubtitleStyleProvider settings) {
  //   return Column(
  //     children: [
  //       // 1) 섹션 타이틀 (-> 자막 설정)
  //       SetSectionTitle(title: AppTitles.subtitleSectionTitle),
  //       SizedBox(height: 10),
  //       // 2) 배경 컨테이너
  //       SettingsBackgroundContainer(
  //         child: Column(
  //           children: [
  //             _buildSmallContainer(
  //               child: MultiLanguageDropdown(
  //                 title: "언어",
  //                 selectedLanguages: settings.selectedOutputLanguages,
  //                 availableLanguages: outputLanguagesList,
  //                 onChanged: (List<String> newLanguages) {
  //                   settings.updateOutputLanguages(newLanguages); // 자막 언어 설정
  //                   final currentMode =
  //                       context.read<ModeProvider>().currentMode;
  //                   if (currentMode == Mode.conference) {
  //                     // 토론 모드 시
  //                     settings.updateInputLanguages(
  //                       newLanguages,
  //                     ); // 자막 언어 = 음성 언어
  //                   }
  //                 },
  //                 screenWidth: widget.screenWidth,
  //                 screenHeight: widget.screenHeight,
  //                 isInputLanguage: false, // 음성 언어 선택 여부 (false -> 자막 언어 선택 중)
  //               ),
  //             ),
  //             SizedBox(height: 20),
  //             _buildSubSection(
  //               title: "스타일",
  //               content: _buildMediumContainer(
  //                 child: Column(
  //                   children: [
  //                     _buildPositionDropdown(),
  //                     _buildDivider(),
  //                     _buildStyleDropdown(),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: 20),
  //             _buildSubSection(
  //               title: "텍스트",
  //               content: _buildMediumContainer(
  //                 child: Column(
  //                   children: [
  //                     _buildSizeDropdown(),
  //                     _buildDivider(),
  //                     _buildTextColorDropdown(),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: 20),
  //             _buildSubSection(
  //               title: "배경",
  //               content: _buildMediumContainer(
  //                 child: Column(
  //                   children: [
  //                     _buildBackgroundColorDropdown(),
  //                     _buildDivider(),
  //                     _buildOpacityDropdown(),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}