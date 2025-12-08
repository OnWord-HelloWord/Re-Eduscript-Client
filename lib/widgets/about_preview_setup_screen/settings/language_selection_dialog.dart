
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/providers/language_settings_provider.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/language_dialog/searching_box_widget.dart';
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/language_dialog/set_languages_button_widget.dart'; // [providers] 언어 선택
import 'package:re_eduscript_client/core/styles/app_colors.dart'; // [cores] 색상
import 'package:re_eduscript_client/core/constants/app_languages.dart'; // [cores] 언어

class LanguageSelectionDialog extends StatefulWidget {
  final List<String> availableLanguages;  // 모든 언어 리스트
  final List<String> selectedLanguages;   // 선택된 언어 리스트
  final bool isLectureMode;               // 현재 모드 (강의, 토론)
  final bool isSelected;                  // 선택 여부

  const LanguageSelectionDialog({
    super.key,
    required this.availableLanguages,
    required this.selectedLanguages,
    required this.isLectureMode,
    required this.isSelected
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

  // 언어 검색 필터링 메서드
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

  // 단일 언어 선택
  void _toggleLanguage(String language, bool? value) {
    setState(() {
      if (value == true) {
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
            // [3] 언어 선택 리스트
            Expanded(
              child: ListView.builder(
                itemCount: _filteredLanguages.length,
                itemBuilder: (context, index) {
                  final language = _filteredLanguages[index];
                  final isSelected = _newSelectedLanguages.contains(language);

                  // 1) 강의 모드일 때 (단일 언어 인식)
                  if (widget.isLectureMode && widget.isSelected) {
                    return ListTile(
                      // 특정 언어
                      title: Text(language, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      // 아이콘
                      trailing: isSelected ? Icon(Icons.check, color: AppColors.blueLightColor, size: 24) : null,
                      onTap: () {
                        setState(() {
                          _newSelectedLanguages.clear();
                          _newSelectedLanguages.add(language);
                        });
                      },
                    );
                  }

                  // 2) 토론 모드일 때 (다중 언어 인식)
                  else {
                    return CheckboxListTile(
                      title: Text(language, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      value: isSelected,
                      activeColor: AppColors.blueLightColor,
                      checkColor: Colors.white,
                      hoverColor: AppColors.blueLightColor.withOpacity(0.05),
                      side: BorderSide(
                        color: isSelected ? AppColors.blueLightColor : Colors.grey,
                        width: 2,
                      ),
                      onChanged: (value) => _toggleLanguage(language, value),
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
                  buttonColor: AppColors.blueColor,
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
