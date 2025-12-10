// [widgets/about_preview_setup_screen/settings/dropdowns/font_background_color_dropdown.dart]
// [자막 설정 드롭다운 - 폰트 배경 색상]

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/providers/subtitle_style_provider.dart'; // [provider] 자막 스타일
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/common_setting_dropdown.dart'; // [widgets] 공통 드롭다운 디자인

class FontBackgroundColorDropdown extends StatelessWidget {
  const FontBackgroundColorDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    // [provider] 자막 스타일 받아오기 (폰트 배경 색상)
    final styles = context.watch<SubtitleStyleProvider>();

    return CommonSettingDropdown(
      name: "색상",
      initialValue: styles.selectedBackgroundColor, // 초기값
      optionList: styles.backgroundColorOptions,    // 옵션 리스트
      onChanged: (String newColor) {                // 상태 변화
        styles.updateBackgroundColor(newColor);
      },
      isColorDropdown: true,                        // 드롭다운에 색상 원 표시
    );
  }
}
