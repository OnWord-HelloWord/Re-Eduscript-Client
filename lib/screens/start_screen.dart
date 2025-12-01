// [lib/screens/start_screen.dart]
// [screen] 시작 화면 -> 모드 선택
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/core/styles/app_colors.dart';        // [core] 색상
import 'package:re_eduscript_client/core/styles/app_sizes.dart';         // [core] 사이즈
import 'package:re_eduscript_client/core/constants/app_enums.dart';      // [core] 모드
import 'package:re_eduscript_client/providers/mode_provider.dart';       // [providers] 모드
import 'package:re_eduscript_client/screens/preview_setup_screen.dart';  // [screens] 대기 화면
import 'package:re_eduscript_client/widgets/mode_button_section.dart';   // [widgets] 버튼 선택 위젯

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  // 0) 모드 선택 출력 여부
  bool _isModeSelectionVisible = false;
  // 1) 모드 선택 섹션 출력 (true)
  void _setModeSelectionVisible() {
    setState(() {
      _isModeSelectionVisible = true;
    });
  }
  // 2) 모드 선택 섹션 지우기 (false)
  void _hideModeSelection() {
    setState(() {
      _isModeSelectionVisible = false;
    });
  }
  // 3) 모드 할당, 화면 이동
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
          child: Stack(
              children: [
                Column(
                  children: [
                    // 상단 여백
                    SizedBox(height: screenHeight * 0.15),

                    // [1] 제목 섹션
                    _isModeSelectionVisible
                        ? _buildModeTitle()   // [1-2] 모드 선택 화면 제목
                        : _buildStartTitle(), // [1-1] 시작 화면 제목

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
                // [3] 뒤로 가기 버튼 (모드 선택 -> 시작 화면)
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

  // [1] 제목 섹션 (제목 + 소제목)
  Widget _buildTitleSection(String subtitleText) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1) 제목 (공통)
          Text(
            'EduScript',
            style: TextStyle(
              fontSize: AppSizes.startTitleFontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.bluePrimaryColor,
              letterSpacing: AppSizes.startTitleSpacing,
            ),
          ),
          SizedBox(height: 20), // 여백
          // 2) 소제목
          Text(
              subtitleText, // 전달 받은 매개변수 (소제목)
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: AppSizes.startSubTitleFontSize,
                color: AppColors.greyFontColor,
                letterSpacing: AppSizes.startSubTitleSpacing,
              )
          ),
        ],
      ),
    );
  }

  // [1-1] 시작 화면 제목
  Widget _buildStartTitle() {
    return _buildTitleSection('AI 기반 실시간 스크립트 생성');
  }

  // [1-2] 모드 선택 화면 제목
  Widget _buildModeTitle() {
    return _buildTitleSection('모드를 선택하세요');
  }
}
