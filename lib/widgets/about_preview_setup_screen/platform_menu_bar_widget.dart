// [메뉴바 위젯]

import 'package:flutter/material.dart';

class PlatformMenuBarWidget extends StatelessWidget {
  final VoidCallback onSelectLectureMode;     // 강의 모드 선택 시
  final VoidCallback onSelectConferenceMode;  // 토론 모드 선택 시
  final Widget child;

  const PlatformMenuBarWidget({
    super.key,
    required this.onSelectLectureMode,
    required this.onSelectConferenceMode,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformMenuBar(
      menus: <PlatformMenuItem> [
        PlatformMenu(
            label: "모드 선택",
            menus: <PlatformMenuItem> [
              // PlatformMenuItem(label: "시작 화면", onSelected: onSelectStartScreen),
              // PlatformMenuItem.separator,
              PlatformMenuItem(label: "강의 모드", onSelected: onSelectLectureMode),
              PlatformMenuItem(label: "토론 모드", onSelected: onSelectConferenceMode),
            ]
        )
      ],
      child: child,
    );
  }
}
