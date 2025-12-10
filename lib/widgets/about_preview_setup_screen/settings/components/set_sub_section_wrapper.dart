// [widgets/about_preview_setup_screen/settings/components/set_sub_section_wrapper.dart]
// [서브 섹션 래퍼..?]

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/core/styles/app_sizes.dart';  // [cores] 사이즈

class SetSubSectionWrapper extends StatelessWidget {
  final String title;   // 서브 섹션 제목
  final Widget content; // 내용
  final double spacing; // 간격 (제목 <-> 내용)

  const SetSubSectionWrapper({
    super.key,
    required this.title,
    required this.content,
    this.spacing = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 정렬을 위해 추가
      children: [
        Row(
          children: [
            Text(
              title,  // 1) 서브 섹션 제목 지정
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppSizes.baseFontSize,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: spacing), // 2) 여백
        content,                   // 3) 내용
      ],
    );
  }
}
