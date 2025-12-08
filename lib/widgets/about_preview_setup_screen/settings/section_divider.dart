// []
// [settings] 위젯을 구분하는 구분선 (UI)

import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey, // 회색
      thickness: 1,       // 두께
      height: 1,          // 높이
    );
  }
}
