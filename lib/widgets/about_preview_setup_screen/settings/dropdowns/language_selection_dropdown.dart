// []
// [widgets] 언어 선택 드롭다운

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/core/styles/app_sizes.dart';        // [enums] 사이즈
import 'package:re_eduscript_client/core/constants/app_enums.dart';     // [enums] 모드
import 'package:re_eduscript_client/providers/mode_provider.dart';      // [providers] 모드
import 'package:re_eduscript_client/providers/language_settings_provider.dart'; // [providers] 언어 선택
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/language_dialog/language_selection_dialog.dart';  // [] 다이얼로그


class LanguageSelectionDropdown extends StatelessWidget {
  final List<String> selectedLanguages;   // 선택된 언어 리스트
  final List<String> availableLanguages;  // 선택 가능한 언어 리스트
  final Function(List<String>) onChanged; // 인식 언어 업데이트
  final bool isInputLanguage;             // 입력 언어일 때
  final double screenWidth;
  final double screenHeight;

  const LanguageSelectionDropdown({
    super.key,
    required this.selectedLanguages,
    required this.availableLanguages,
    required this.onChanged,
    required this.isInputLanguage,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    // [provider] 선택된 언어 받아오기
    final languages = context.watch<LanguageSettingsProvider>();

    // 입력 언어 선택 시 -> 선택된 입력 언어 출력
    // 아닐 경우 -> 선택된 출력 언어 출력
    final List<String> currentSelectedLanguages = isInputLanguage
      ? languages.selectedInputLanguages : languages.selectedOutputLanguages;

    // 선택된 언어 출력 메서드
    String _getDisplayText() {
      if (currentSelectedLanguages.isEmpty) {
        return '언어를 선택하세요';
      } else if (currentSelectedLanguages.length == 1) {
        return currentSelectedLanguages.first;
      } else {
        return '${currentSelectedLanguages.first} 외 ${currentSelectedLanguages.length - 1}개';
      }
    }

    // 언어 선택 다이얼로그 출력 메서드
    void _showLanguageDialog(BuildContext context) async {
      // [provider] 현재 선택된 모드
      // 강의 모드 true, 토론 모드 false
      final mode = Provider.of<ModeProvider>(context, listen: false).currentMode;
      final bool isLectureMode = mode == Mode.lecture;

      final result = await showDialog<List<String>>(
        context: context,
        builder:
            (context) => LanguageSelectionDialog(
          availableLanguages: availableLanguages, // 모든 언어 리스트
          selectedLanguages: currentSelectedLanguages, // 선택된 언어 리스트
          isLectureMode: isLectureMode,           // 현재 모드 (강의, 토론)
          isInputLanguage: isInputLanguage,       // 입력 언어일 때
        ),
      );

      if (result != null) { // 리스트에 변동이 있을 때
        onChanged(result);  // 인식 언어 업데이트
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // [1] 이름
        Text(
          "언어",
          style: TextStyle(
            fontSize: AppSizes.baseFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        // [2] 드롭다운 위젯
        InkWell(
          onTap: () => _showLanguageDialog(context),
          borderRadius: BorderRadius.circular(5),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1) 선택된 언어 출력
                Text(
                  _getDisplayText(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: AppSizes.baseFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                // 2) 아이콘
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,             // 색상
                  size: AppSizes.dropdownIconSize, // 크기
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
