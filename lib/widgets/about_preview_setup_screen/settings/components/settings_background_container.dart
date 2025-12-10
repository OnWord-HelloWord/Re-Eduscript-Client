// [widgets/about_preview_setup_screen/settings/components/settings_background_container.dart]
// [설정 섹션 배경 컨테이너]

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/core/styles/app_sizes.dart'; // [cores] 사이즈

class SettingsBackgroundContainer extends StatelessWidget {
  final Widget child;

  const SettingsBackgroundContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(AppSizes.backContainerRadius), // 둥글기 7
      ),
      child: child,
    );
  }
}
