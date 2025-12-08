import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/providers/subtitle_style_provider.dart'; // [provider] 자막 스타일
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/dropdowns/common_setting_dropdown.dart'; // [widgets] 공통 드롭다운 디자인

class VerticalPositionDropdown extends StatelessWidget {
  const VerticalPositionDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    // [provider] 자막 스타일 받아오기 (Horizontal 정렬)
    final styles = context.watch<SubtitleStyleProvider>();

    return CommonSettingDropdown(
      name: "정렬",
      initialValue: styles.selectedVerticalPosition, // 초기값
      optionList: styles.verticalPositionOptions,    // 옵션 리스트
      onChanged: (String newPosition) {              // 상태 변화
        styles.updateVerticalPosition(newPosition);
      },
    );
  }
}
