// [widgets/about_preview_setup_screen/settings/language_dialog/searching_box_widget.dart]
// [언어 선택 다이얼로그 창 - 검색 상자 위젯]

import 'package:flutter/material.dart';

class SearchingBox extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const SearchingBox({super.key, required this.hintText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText:hintText, // 힌트 텍스트
        hintStyle: const TextStyle(color: Colors.grey), // 색상
        prefixIcon: const Icon(Icons.search, color: Colors.black,), // 아이콘
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        // 기본 테두리 디자인
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 2),
        ),
        // 포커스 시 테두리 디자인
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),

      ),
      onChanged: onChanged
    );
  }
}


