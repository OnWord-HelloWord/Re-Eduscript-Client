// [widgets/about_preview_setup_screen/settings/screen_shared_status_section.dart]
// [대기화면 -> 자막 스타일 -> 화면 공유 섹션 (ON/OFF 선택)]

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/core/constants/app_titles.dart'; // [cores] 타이틀
import 'package:re_eduscript_client/core/styles/app_sizes.dart';     // [cores] 사이즈
import 'package:re_eduscript_client/providers/subtitle_style_provider.dart'; // [providers] 자막 스타일 (화면 공유 상태)
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/set_section_title.dart'; // [widgets] 제목 지정
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/settings_background_container.dart'; // [widgets] 배경 컨테이너
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/onoff_switch_widget.dart'; // [widgets] ON/OFF 위젯
import 'package:re_eduscript_client/widgets/about_preview_setup_screen/settings/components/setting_item_wrapper.dart';  // [widgets] 이름 + 드롭다운 랩퍼

class ScreenSharedStatusSection extends StatelessWidget {
  const ScreenSharedStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    // [provider] 화면 공유 상태
    final styles = context.watch<SubtitleStyleProvider>();

    return Column(
      children: [
        // 1) 섹션 타이틀 (-> 화면 공유)
        SetSectionTitle(title: AppTitles.screenShareSectionTitle),
        SizedBox(height: 10), // 여백
        // 2) 배경 컨테이너
        SettingsBackgroundContainer(
          child: Column(
            children: [
              SettingItemWrapper(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 이름
                    Text(
                      "화면 공유 OFF/ON",
                      style: TextStyle(
                        fontSize: AppSizes.baseFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    // 스위치 위젯
                    OnoffSwitch(
                      initialValue: styles.screenSharedEnabled,     // 초기 상태
                      onChanged: (bool newValue) {                    // 상태 변화 시 업데이트
                        styles.updateScreenShareedEnabled(newValue);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
