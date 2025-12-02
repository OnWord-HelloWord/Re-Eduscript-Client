// [lib/models/language_mapping_mode.dart]
// [특정 언어에 대한 표시 정보]

class LanguageMappingModel {

  // [멤버 필드]
  final String displayName;       // 언어 이름
  final String language;          // 언어의 현지 이름
  final String speechCode;        // STT 국가 코드
  final String translationCode;   // 번역 국가 코드
  final String previewText;       // 예시 텍스트

  // [생성자]
  LanguageMappingModel({
    required this.displayName,
    required this.language,
    required this.speechCode,
    required this.translationCode,
    required this.previewText,
  });

  // 디버깅용 문자열 변환
  @override
  String toString() {
    String result =
        'LanguageMappingModel(displayName: $displayName, '
        'country: "$language", '
        'speechCode: "$speechCode", '
        'translationCode: "$translationCode",  '
        'previewText: "$previewText", )';

    return result;
  }
}
