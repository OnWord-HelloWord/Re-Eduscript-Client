// []
// [settings] 섹션 배경 컨테이너

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
      padding: const EdgeInsets.all(10),                               //응 ?
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(AppSizes.containerRadius), // 둥글기 7
      ),
      child: child,
    );
  }
}
