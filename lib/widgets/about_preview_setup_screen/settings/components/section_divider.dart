// [widgets/about_preview_setup_screen/settings/components/section_divider.dart]
// [드롭다운 위젯 구분선]

import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {

  const SectionDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0), // 구분선 가로 길이 지정
      child: const Divider(
        color: Colors.grey, // 회색
        thickness: 1,       // 두께
        height: 1,          // 높이
      ),
    );
  }
}
