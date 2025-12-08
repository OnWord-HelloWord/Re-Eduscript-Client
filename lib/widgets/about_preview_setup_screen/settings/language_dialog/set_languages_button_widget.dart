
import 'package:flutter/material.dart';

class SetLanguagesButton extends StatelessWidget {
  final Color buttonColor;      // 버튼 배경색
  final String buttonName;      // 버튼 텍스트
  final Color buttonFontColor;  // 버튼 폰트 색
  final VoidCallback onPressed; // 버튼 클릭 시 콜백

  const SetLanguagesButton({
    super.key,
    required this.buttonColor,
    required this.buttonName,
    required this.buttonFontColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
      ),
      child: Text(buttonName, style: TextStyle(color: buttonFontColor),),
    );
  }
}
