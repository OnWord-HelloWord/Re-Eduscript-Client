// [lib/providers/subtitle_style_provider.dart]
// [자막 스타일 관리]

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:re_eduscript_client/core/styles/app_sizes.dart';  // [cores] 사이즈

class SubtitleStyleProvider extends ChangeNotifier {

  // [멤버 필드] 스타일 변수
  bool _screenSharedEnabled = false;             // 화면 공유 상태
  String _selectedVerticalPosition = '중앙';      // 자막 세로 정렬
  String _selectedHorizontalPosition = '좌측';    // 자막 가로 정렬
  String _selectedFontStyle = '기본';             // 폰트 스타일
  String _selectedFontSize = '중간';              // 폰트 크기
  String _selectedFontColor = '흰색';             // 폰트 색상
  String _selectedBackgroundColor = '흰색';       // 폰트 배경색
  String _selectedBackgroundOpacity = '0%';       // 폰트 배경 투명도

  // [Getter] 현재 상태 받아오기
  bool get screenSharedEnabled => _screenSharedEnabled;
  String get selectedVerticalPosition => _selectedVerticalPosition;
  String get selectedHorizontalPosition => _selectedHorizontalPosition;
  String get selectedFontStyle => _selectedFontStyle;
  String get selectedFontSize => _selectedFontSize;
  String get selectedFontColor => _selectedFontColor;
  String get selectedBackgroundColor => _selectedBackgroundColor;
  String get selectedBackgroundOpacity => _selectedBackgroundOpacity;

  // [Getter] 옵션 가져오기
  List<String> get verticalPositionOptions => ['상단', '중앙', '하단'];
  List<String> get horizontalPositionOptions => ['좌측', '중앙', '우측'];
  List<String> get fontStyleOptions => ['기본', '굵게', '이탤릭'];
  List<String> get fontSizeOptions => ['매우 작게', '작게', '중간', '크게', '매우 크게'];
  List<String> get fontColorOptions =>
      ['흰색', '검정', '빨강', '주황', '노랑', '초록', '파랑', '보라'];
  List<String> get backgroundColorOptions =>
      ['흰색', '검정', '빨강', '주황', '노랑', '초록', '파랑', '보라'];
  List<String> get backgroundOpacityOptions =>
      ['0%', '25%', '50%', '75%', '100%'];

  // 색상 매핑 메서드
  Color mapColorName(String color) {
    switch (color) {
      case '빨강': return Colors.red;
      case '주황': return Colors.orange;
      case '노랑': return Colors.yellow;
      case '초록': return Colors.green;
      case '파랑': return Colors.blue;
      case '보라': return Colors.purple;
      case '검정': return Colors.black;
      case '흰색':
      default:
        return Colors.white;
    }
  }

  // [Setter] 상태 업데이트
  // 1) 화면 공유 상태 변경
  void updateScreenShareedEnabled(bool enabled) {
    _screenSharedEnabled = enabled; // 화면 공유 ON
    notifyListeners();              // UI 업데이트
    debugPrint("[화면 공유 상태] $screenSharedEnabled");
  }

  // 2) 자막 세로 정렬 변경
  void updateVerticalPosition(String position) {
    _selectedVerticalPosition = position;
    notifyListeners();
  }

  // 3) 자막 가로 정렬 변경
  void updateHorizontalPosition(String position) {
    _selectedHorizontalPosition = position;
    notifyListeners();
  }

  // 4) 폰트 스타일 변경
  void updateFontStyle(String style) {
    _selectedFontStyle = style;
    notifyListeners();
  }

  // 5) 폰트 크기 변경
  void updateFontSize(String size) {
    _selectedFontSize = size;
    notifyListeners();
  }

  // 6) 폰트 색상 변경
  void updateFontColor(String color) {
    _selectedFontColor = color;
    notifyListeners();
  }

  // 7) 폰트 배경색 변경
  void updateBackgroundColor(String color) {
    _selectedBackgroundColor = color;
    notifyListeners();
  }

  // 8) 폰트 배경색 투명도 변경
  void updateBackgroundOpacity(String opacity) {
    _selectedBackgroundOpacity = opacity;
    notifyListeners();
  }

  // [스타일 변환]
  // 1) 화면 공유 상태 ON/OFF

  // 2) 자막 세로 정렬
  MainAxisAlignment getAlignment() {
    switch (_selectedVerticalPosition) {
      case '상단':
        return MainAxisAlignment.start;
      case '중앙':
        return MainAxisAlignment.center;
      case '하단':
      default:
        return MainAxisAlignment.end;
    }
  }

  // 3) 자막 가로 정렬
  CrossAxisAlignment getHorizontalAlignment() {
    switch (_selectedHorizontalPosition) {
      case '좌측':
        return CrossAxisAlignment.start; // 왼쪽 정렬
      case '중앙':
        return CrossAxisAlignment.center; // 가운데 정렬
      case '우측':
        return CrossAxisAlignment.end; // 오른쪽 정렬
      default:
        return CrossAxisAlignment.start; // 기본값
    }
  }

  // 4) 폰트 스타일
  // 볼드체
  FontWeight getFontWeight() {
    return _selectedFontStyle == '굵게' ? FontWeight.bold : FontWeight.normal;
  }

  // 이탤릭체
  FontStyle getFontStyle() {
    return _selectedFontStyle == '이탤릭' ? FontStyle.italic : FontStyle.normal;
  }

  // 5) 폰트 크기
  double getFontSize(double screenWidth) {
    double baseSize = AppSizes.smallFontSize;
    switch (_selectedFontSize) {
      case '매우 작게':
        return baseSize * 1.7;
      case '중간':
        return baseSize * 2.6;
      case '크게':
        return baseSize * 2.9;
      case '매우 크게':
        return baseSize * 3.2;
      case '작게':
      default:
        return baseSize * 2.3;
    }
  }

  // 6) 폰트 색상
  Color getFontColor() {
    switch (_selectedFontColor) {
      case '빨강':
        return Colors.red;
      case '주황':
        return Colors.orange;
      case '노랑':
        return Colors.yellow;
      case '초록':
        return Colors.green;
      case '파랑':
        return Colors.blue;
      case '보라':
        return Colors.purple;
      case '검정':
        return Colors.black;
      case '흰색':
      default:
        return Colors.white;
    }
  }

  // 7) 폰트 배경색
  Color getBackgroundColor() {
    switch (_selectedBackgroundColor) {
      case '빨강':
        return Colors.red;
      case '주황':
        return Colors.orange;
      case '노랑':
        return Colors.yellow;
      case '초록':
        return Colors.green;
      case '파랑':
        return Colors.blue;
      case '보라':
        return Colors.purple;
      case '검정':
        return Colors.black;
      case '흰색':
      default:
        return Colors.white;
    }
  }

  // 8) 폰트 배경색 투명도
  double getBackgroundOpacity() {
    switch (_selectedBackgroundOpacity) {
      case '0%':
        return 0.0;
      case '25%':
        return 0.25;
      case '75%':
        return 0.75;
      case '100%':
        return 1.0;
      case '50%':
      default:
        return 0.5;
    }
  }
}