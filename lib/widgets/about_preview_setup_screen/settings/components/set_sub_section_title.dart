// [widgets/about_preview_setup_screen/settings/components/set_sub_section_title.dart]
// [서브 섹션 타이틀]

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/core/styles/app_sizes.dart';  // [cores] 사이즈

class SetSubSectionTitle extends StatelessWidget {
  final String title; // 서브 섹션 제목

  const SetSubSectionTitle({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: AppSizes.baseFontSize,
        color: Colors.black,
      ),
    );
  }
}
