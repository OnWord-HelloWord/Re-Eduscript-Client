// [widgets/about_preview_setup_screen/settings/dropdowns/common_setting_dropdown.dart]
// [자막 설정 드롭다운 (공통 위젯)]

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_eduscript_client/core/styles/app_sizes.dart';  // [cores] 사이즈
import 'package:re_eduscript_client/core/utils/color_circle_mixin.dart';
import 'package:re_eduscript_client/providers/subtitle_style_provider.dart';  // [cores] 원 그리기

class CommonSettingDropdown extends StatefulWidget {
  final String name;                    // 항목 이름
  final String initialValue;            // 초기값
  final List<String> optionList;        // 옵션 리스트
  final ValueChanged<String> onChanged; // 상태 변화 (콜백)
  final bool isColorDropdown;           // 색상 드롭다운 여부
  final bool isOpacityDropdown;         // 투명도 드롭다운 여부

  const CommonSettingDropdown({
    super.key,
    required this.name,
    required this.initialValue,
    required this.optionList,
    required this.onChanged,
    this.isColorDropdown = false,   // 기본값 false
    this.isOpacityDropdown = false, // 기본값 false
  });

  @override
  State<CommonSettingDropdown> createState() => _CommonSettingDropdownState();
}

class _CommonSettingDropdownState extends State<CommonSettingDropdown>
    with ColorCircleMixin // 믹스인 가져오기
{
  // [provider] 색상 받아오기
  late final styles = context.watch<SubtitleStyleProvider>();
  final FocusNode _buttonFocusNode = FocusNode(); // 포커스 관리
  late String _selectedValue;                     // 현재 선택된 값 (UI 출력)

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant CommonSettingDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 상태 변경 감지
    if (widget.initialValue != oldWidget.initialValue) { // 값이 변경되면
      setState(() {
        _selectedValue = widget.initialValue; // 새 값으로 갱신
      });
    }
  }

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  void _selectOption(String option) {
    setState(() {
      _selectedValue = option;
    });
    widget.onChanged(option);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // [1] 항목 이름
        Text(
          widget.name,
          style: TextStyle(
            fontSize: AppSizes.baseFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        // [2] 스타일 드롭다운 (MenuAnchor)
        MenuAnchor(
          childFocusNode: _buttonFocusNode,
          // 드롭다운 스타일
          style: MenuStyle(
            backgroundColor: WidgetStateProperty.all(Colors.grey[100]),
            elevation: WidgetStateProperty.all(8.0),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // 둥근 모서리
              ),
            ),
          ),

          // [2-1] 메뉴 아이템 생성 (
          menuChildren: widget.optionList.map((String option) {
            return MenuItemButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                    if (states.contains(WidgetState.hovered)) {
                      return Colors.grey.shade200; // 회색 배경색
                    }
                    return null;
                  },
                ),
                shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                )),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
              ),

              onPressed: () => _selectOption(option),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                child: Row(
                  children: [
                    // [색상,투명도 원 표시]
                    if (widget.isColorDropdown || widget.isOpacityDropdown) ... [
                      buildCircle(
                        value: option,
                        isColorDropdown: widget.isColorDropdown,
                        isOpacityDropdown: widget.isOpacityDropdown,
                        styles: styles,
                      ),
                      const SizedBox(width: 10,),
                    ],
                    // [항목 이름]
                    Text(
                      option,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: AppSizes.baseFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),

          // [2-2] 드롭다운 버튼 (선택된 항목 표시)
          builder: (
              BuildContext context,
              MenuController controller,
              Widget? child,
              ) {
            return InkWell(
              focusNode: _buttonFocusNode,
              onTap: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // [현재 선택된 원 표시]
                    if (widget.isColorDropdown || widget.isOpacityDropdown) ... [
                      buildCircle(
                        value: _selectedValue,
                        isColorDropdown: widget.isColorDropdown,
                        isOpacityDropdown: widget.isOpacityDropdown,
                        styles: styles,
                      ),
                      const SizedBox(width: 5),
                    ],
                    // [현재 선택된 항목]
                    Text(
                      _selectedValue,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: AppSizes.baseFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // 간격
                    const SizedBox(width: 5),
                    // 화살표 아이콘
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: AppSizes.dropdownIconSize,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
