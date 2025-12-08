library;
import 'package:flutter/material.dart';

class OnoffSwitch extends StatefulWidget {
  final bool initialValue;         // 초기 상태
  final Function(bool)? onChanged; // [콜백] 상태 변경

  const OnoffSwitch({
    super.key,
    required this.initialValue,
    this.onChanged
  });

  @override
  State<OnoffSwitch> createState() => _OnoffSwitchState();
}

class _OnoffSwitchState extends State<OnoffSwitch> {
  late bool _isOn; // 현재 상태

  @override
  void initState() {
    super.initState();
    _isOn = widget.initialValue; // 부모로부터 받은 초기값으로 설정
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isOn,              // 현재 스위치 상태
      activeColor: Colors.blue,  // 활성화 시 색상 (ON)
      onChanged: (bool value) {
        setState(() {
          _isOn = value;         // 상태 업데이트
        });
        widget.onChanged?.call(value); // 콜백
      },
    );
  }
}
