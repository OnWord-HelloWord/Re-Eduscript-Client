// [lib/main.dart]
// 플러터 프로젝트 시작점 (main)

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';                // [의존성] 윈도우 매니저
import 'package:re_eduscript_client/providers/mode_provider.dart';  // [Provider] 모드 선택
import 'core/styles/app_sizes.dart';                                // [AppSizes] 최소 창 크기
import 'package:re_eduscript_client/screens/start_screen.dart';     // [Screen] 시작 창

void main() async {
  // [1] 창 관리자 관련 (Window Manager)
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
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ModeProvider(),)
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

