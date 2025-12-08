import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/providers/subtitle_style_provider.dart'; // [provider] 자막 스타일
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/common_setting_dropdown.dart'; // [widgets] 공통 드롭다운 디자인

class FontBackgroundOpacityDropdown extends StatelessWidget {
  const FontBackgroundOpacityDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    // [provider] 자막 스타일 받아오기 (폰트 배경 투명도)
    final styles = context.watch<SubtitleStyleProvider>();

    return CommonSettingDropdown(
      name: "색상",
      initialValue: styles.selectedBackgroundOpacity, // 초기값
      optionList: styles.backgroundOpacityOptions,    // 옵션 리스트
      onChanged: (String newOpacity) {                // 상태 변화
        styles.updateBackgroundOpacity(newOpacity);
      },
    );
  }
}
