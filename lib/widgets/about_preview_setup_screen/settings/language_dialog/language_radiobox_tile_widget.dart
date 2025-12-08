// [widgets] 다이얼로그 창 - 라디오박스 위젯 (단일 선택)

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/core/styles/app_colors.dart'; // [cores] 색상

class LanguageRadioboxTile extends StatelessWidget {
  final String language; // 특정 언어 이름
  final bool isSelected; // 특정 언어 선택 여부
  final VoidCallback onTap; // 상태 변화 (콜백)

  const LanguageRadioboxTile({
    super.key,
    required this.language,
    required this.isSelected,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // [1] 특정 언어 이름
      title: Text(
        language,
        style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      ),
      // [2] 특정 언어 선택 여부에 따른 아이콘
      trailing: isSelected
          ? Icon(Icons.check, color: AppColors.blueLightColor, size: 24)
          : null,
      onTap: onTap,
    );
  }
}
