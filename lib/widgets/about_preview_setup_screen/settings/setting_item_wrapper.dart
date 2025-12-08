// [ ]
// [settings] (이름 + 드롭다운 위젯) 컨테이너

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/core/styles/app_colors.dart'; // [cores] 색상
import 'package:re_eduscript_client/core/styles/app_sizes.dart'; // [cores] 사이즈

class SettingItemWrapper extends StatelessWidget {
  final Widget child;

  const SettingItemWrapper ({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,                                   // 배경색
        borderRadius: BorderRadius.circular(AppSizes.containerRadius), // 둥글기
      ),
      child: child,
    );
  }
}
