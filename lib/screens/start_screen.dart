// [lib/screens/start_screen.dart]
// 시작 화면 -> 모드 선택
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/core/styles/app_colors.dart';
import 'package:re_eduscript_client/core/styles/app_sizes.dart';  //


import 'package:re_eduscript_client/core/constants/app_enums.dart';      // [이넘] 모드
import 'package:re_eduscript_client/providers/mode_provider.dart';       // [프로바이더] 모드
import 'package:re_eduscript_client/screens/preview_setup_screen.dart';  // [스크린] 대기 화면
import 'package:re_eduscript_client/widgets/mode_button_section.dart';   // [위젯] 버튼 선택 위젯

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  // 0) 모드 선택 출력 여부
  bool _isModeSelectionVisible = false;
  // 1) 모드 선택 버튼 출력
  void _setModeSelectionVisible() {
    setState(() {
      _isModeSelectionVisible = true;
    });
  }
  // 2) 모드 선택 버튼 지우기
  void _hideModeSelection() {
    setState(() {
      _isModeSelectionVisible = false;
    });
  }
  // 3) 모드 선택하기
  void _onModeSelected(Mode mode) {
    // [프로바이더] 모드 할당
    Provider.of<ModeProvider>(context, listen: false).setMode(mode);
    debugPrint("[Screen] 현재 선택된 모드 : ${mode.name}");

    // 🔴 파일에 모드 할당 하기 (나중에) 🔴

    // 화면 전환
    Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewSetupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,  // 배경색
      body: SafeArea(

        child: Padding(
          padding: EdgeInsets.all(AppSizes.smallPadding),
          child:  Stack(
              children: [
                Column(
                  children: [
                    // 상단 여백
                    SizedBox(height: screenHeight * 0.15),

                    // [1] 제목 섹션 (모드 선택 시 상단으로 이동)
                    _isModeSelectionVisible
                        ? _buildModeTitleSection()   // [2] 모드 선택 화면
                        : _buildStartTitleSection(), // [1] 시작 화면

                    // 중간 여백
                    SizedBox(height: screenHeight * 0.15),

                    // [2] 버튼 섹션
                    // (호출) 모드 버튼 섹션
                    ModeButtonSection(
                      showModeSelection: _isModeSelectionVisible, // 모드 선택 섹션 출력 여부
                      onStartPressed: _setModeSelectionVisible,   // 모드 선택 섹션 출력하기
                      onModeSelected: _onModeSelected,            // 모드 할당
                    ),
                  ],
                ),
                _isModeSelectionVisible
                    ? IconButton(
                  onPressed: _hideModeSelection,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.greyFontColor,
                  ),
                )
                    : SizedBox.shrink(),
            ]
          ),
        ),
      ),
    );
  }

  // [1] 시작 화면 (제목 + 소제목)
  Widget _buildStartTitleSection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'EduScript',
            style: TextStyle(
              fontSize: AppSizes.startTitleFontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.blueColor1,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'AI 기반 실시간 스크립트 생성',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: AppSizes.startSubTitleFontSize,
              color: AppColors.greyFontColor,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  // [2] 모드 선택 화면 (제목 + 소제목)
  Widget _buildModeTitleSection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'EduScript',
            style: TextStyle(
              fontSize: AppSizes.startTitleFontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.blueColor1,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 20),
          Text(
            '모드를 선택하세요',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: AppSizes.startSubTitleFontSize,
              color: AppColors.greyFontColor,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
