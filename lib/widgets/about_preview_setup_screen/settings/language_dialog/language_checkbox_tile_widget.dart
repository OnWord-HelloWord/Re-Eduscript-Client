// [widgets/about_preview_setup_screen/settings/language_dialog/language_checkbox_tile_widget.dart]
// [언어 선택 다이얼로그 창 - 체크박스 위젯 (다중 선택)]

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/core/styles/app_colors.dart'; // [cores] 색상

class LanguageCheckboxTile extends StatelessWidget {
  final String language;  // 특정 언어 이름
  final bool isSelected;  // 특정 언어 선택 여부
  final ValueChanged<bool?> onChanged; // 상태 변화 콜백

  const LanguageCheckboxTile({
    super.key,
    required this.language,
    required this.isSelected,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      // [1] 특정 언어 이름
      title: Text(
        language,
        style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      ),

      // [2] 특정 언어 선택 여부
      value: isSelected,

      // [3] 체크박스 스타일
      // 1) 체크박스 색상 설정
      activeColor: AppColors.blueLightColor,  // 체크된 상태 배경색
      checkColor: Colors.white,               // 체크 마크 색상
      // 2) 호버/포커스 색상
      hoverColor: AppColors.blueLightColor.withOpacity(0.05),
      // 3) 테두리 색상 (체크되지 않은 상태)
      side: BorderSide(
        color: isSelected
            ? AppColors.blueLightColor  // 체크 되었을 때
            : Colors.grey,              // 체크되지 않았을 때
        width: 2,
      ),

      // [4] 상태 변화 (콜백)
      onChanged: onChanged
    );
  }
}
