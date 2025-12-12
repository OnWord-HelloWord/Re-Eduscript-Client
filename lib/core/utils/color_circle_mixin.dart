// [색상, 투명도 원 그리기]

import 'package:flutter/material.dart';
import 'package:re_eduscript_client/providers/subtitle_style_provider.dart';

mixin ColorCircleMixin {
  // [색상, 투명도 드롭다운 변수]
  static const double circleSize = 15.0;         // 동그라미 크기
  static const double borderWidth = 1.0;         // 동그라미 테두리 두께
  static const opacityBaseColor = Color.fromRGBO(33, 150, 243, 1.0); // 투명도 기본 색상

  // [1] 색상 원 그리기
  Widget buildColorCircle(String _color, SubtitleStyleProvider styles) {
    final color = styles.mapColorName(_color); // 색상 매핑
    final needsBorder = color == Colors.white; //

    return Container(
      width: circleSize, height: circleSize,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: needsBorder ? Border.all(color: Colors.grey[400]!, width: borderWidth) : null,
      ),
    );
  }

  // [2] 투명도 원 그리기
  // - 투명도 값 가져오기
  double getOpacityValue(String _opacity) {
    final numericPart = _opacity.replaceAll('%', '');
    return (double.tryParse(numericPart) ?? 0) / 100.0;
  }

  // - 투명도 원 그리기
  Widget buildOpacityCircle(String _opacity) {
    final opacity = getOpacityValue(_opacity);

    return Container(
        width: circleSize, height: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[400]!, width: borderWidth),
        ),
        child: ClipOval(
          child: Stack(children: [
            Container(color: Colors.white),
            Container(
              // withOpacity를 사용해야 Color 객체의 투명도가 적용됨
              color: opacityBaseColor.withOpacity(opacity),
            ),
          ],
          ),
        )
    );
  }

  // [3] 색상,투명도 원 구분
  Widget buildCircle({
    required String value,
    required bool isColorDropdown,
    required bool isOpacityDropdown,
    required SubtitleStyleProvider styles
  }) {
    if (isColorDropdown) { // 색상 원일 때
      return buildColorCircle(value, styles); // (호출) [1] 색상 원
    }
    else if (isOpacityDropdown) { // 투명도일 때
      return buildOpacityCircle(value); // (호출) [2] 투명도 원
    }
    return const SizedBox(width: circleSize, height: circleSize);
  }
}