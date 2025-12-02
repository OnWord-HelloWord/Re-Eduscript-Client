// [lib/main.dart]
// 플러터 프로젝트 시작점 (main)

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:re_eduscript_client/providers/mode_provider.dart'; // [providers]
import 'package:re_eduscript_client/providers/language_settings_provider.dart';
import 'package:re_eduscript_client/providers/language_mapping_provider.dart';
import 'package:re_eduscript_client/providers/subtitle_style_provider.dart';
import 'package:re_eduscript_client/core/styles/app_sizes.dart';  // [cores]                               // [AppSizes] 최소 창 크기
import 'package:re_eduscript_client/screens/start_screen.dart';   // [screens]

void main() async {
  // [창 관리자 관련] (Window Manager)
  // 1) 초기화
  WidgetsFlutterBinding.ensureInitialized(); // 채널 초기화
  await windowManager.ensureInitialized();   // 창 관리자 초기화
  // 2) 창 옵션 지정
  WindowOptions windowOptions = WindowOptions(
    size: const Size(AppSizes.minScreenWidth, AppSizes.minScreenHeight),  // 화면 기본 크기
    minimumSize: Size(AppSizes.minScreenWidth, AppSizes.minScreenHeight), // 화면 최소 크기
    center: true,                         // 화면 정중앙에서 시작
    skipTaskbar: false,                   // 작업 표시줄에 표시 (표시 O)
    titleBarStyle: TitleBarStyle.normal,  // 제목 표시줄 (표준)
    title: "EduScript",                   // 창 제목
  );

  // 3) 창 옵션 적용
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();           // 위 설정대로 창 출력
    await windowManager.focus();          // 표시된 창에 포커스 (활성화)
  });

  runApp(
    // [프로바이더 등록]
      MultiProvider(
        providers: [
          // 1) Mode 관리
          ChangeNotifierProvider(create: (context) => ModeProvider()),
          // 2) 입출력 언어 관리
          ChangeNotifierProvider(
            create: (context) => LanguageSettingsProvider(
              Provider.of<ModeProvider>(context, listen: false), // 현재 모드 전달
            ),
          ),
          // 3) 국가별 언어 매핑 관리
          ChangeNotifierProvider(create: (context) => LanguageMappingProvider()),
          // 4) 자막 스타일 관리
          ChangeNotifierProvider(create: (context) => SubtitleStyleProvider())
        ],
        child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // 디버깅 모드
      title: 'EduScript',                 // 제목
      home: const StartScreen(),          // 시작 화면 전환
    );
  }
}

