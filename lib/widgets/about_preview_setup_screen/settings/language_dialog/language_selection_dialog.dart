
import 'package:flutter/material.dart';

import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/language_dialog/set_languages_button_widget.dart'; // [providers] 언어 선택
import 'package:re_eduscript_client/core/styles/app_colors.dart'; // [cores] 색상
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/language_dialog/language_checkbox_tile_widget.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/language_dialog/searching_box_widget.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/language_dialog/language_radiobox_tile_widget.dart';
class LanguageSelectionDialog extends StatefulWidget {
  final List<String> availableLanguages;  // 모든 언어 리스트
  final List<String> selectedLanguages;   // 선택된 언어 리스트
  final bool isLectureMode;               // 현재 모드 (강의, 토론)
  final bool isInputLanguage;             // 입력 언어일 때

  const LanguageSelectionDialog({
    super.key,
    required this.availableLanguages,
    required this.selectedLanguages,
    required this.isLectureMode,
    required this.isInputLanguage
  });

  @override
  State<LanguageSelectionDialog> createState() => _LanguageSelectionDialogState();
}

class _LanguageSelectionDialogState extends State<LanguageSelectionDialog> {
  String _searchQuery = '';                // 검색할 언어
  late List<String> _filteredLanguages;    // 검색된 언어
  late List<String> _newSelectedLanguages; // 선택된 언어 리스트

  @override
  void initState() {
    super.initState();
    // 선택된 언어로 리스트 초기화
    _newSelectedLanguages = List.from(widget.selectedLanguages);
    // 초기에는 모든 언어 출력
    _filteredLanguages = widget.availableLanguages;
  }

  // 언어 검색, 필터링 메서드
  void _filterLanguages(String newQuery) {
    setState(() {
      // 검색 상태 업데이트
      _searchQuery = newQuery;
      // 검색어가 비어있을 때
      if (_searchQuery.isEmpty) {
        _filteredLanguages = widget.availableLanguages; // 전체 출력
      }
      // 검색어가 있을 때
      else {
        _filteredLanguages = widget.availableLanguages
          .where(
            (lang) => lang.toLowerCase().contains(_searchQuery.toLowerCase()),
          ).toList();
      }
    });
  }

  // 다중 언어 선택 시, 리스트 변경
  void _changeLanguage(String language, bool? value) {
    setState(() {
      if (value == true) { // 사용자가 체크했을 때 !
        _newSelectedLanguages.add(language);
      } else {
        _newSelectedLanguages.remove(language);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.8,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // [1] 헤더
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                '언어 선택',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), // 🔴 제목 색상
              ),
            ),
            SizedBox(height: 16),
            // [2] 언어 검색 창
            SearchingBox(
              hintText: "언어 검색...",
              onChanged: _filterLanguages, // (호출) 검색어가 변경될 때마다 호출
            ),
            SizedBox(height: 16),
            // [3] 언어 선택 리스트 + 체크박스
            Expanded(
              child: ListView.builder(
                itemCount: _filteredLanguages.length, // 검색된 언어 수
                itemBuilder: (context, index) {
                  final language = _filteredLanguages[index]; // 현재 검색된 언어
                  final isSelected = _newSelectedLanguages.contains(language); // 언어 선택 여부
                  // 1) 라디오박스 위젯 (단일 선택)
                  // -> 강의 모드 && 입력 언어일 때
                  if (widget.isLectureMode && widget.isInputLanguage) {
                    return LanguageRadioboxTile(
                      language: language,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          _newSelectedLanguages.clear();
                          _newSelectedLanguages.add(language);
                        });
                      }
                    );
                  }
                  // 2) 체크 박스 위젯 (다중 선택)
                  else {
                    return LanguageCheckboxTile(
                      language: language,
                      isSelected: isSelected,
                      onChanged: (value) => _changeLanguage(language, value),
                    );
                  }
                },
              ),
            ),

            // [4] 취소/확인 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // - 취소 버튼
                SetLanguagesButton(
                    buttonColor: Colors.grey[200]!,
                    buttonName: "취소",
                    buttonFontColor: Colors.black,
                    onPressed: () => Navigator.pop(context), // 취소 클릭
                ),
                SizedBox(width: 8),
                // - 확인 버튼
                SetLanguagesButton(
                  buttonColor: AppColors.blueLightColor,
                  buttonName: "확인",
                  buttonFontColor: Colors.white,
                  onPressed:
                      () => Navigator.pop(context, _newSelectedLanguages), // 확인 클릭
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
