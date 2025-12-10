// [lib/providers/language_mapping_provider.dart]
// [국가별 언어 매핑 관리]
// 미리보기 텍스트 반환 및 국가 코드 매핑 관리
import 'package:flutter/foundation.dart';
import 'package:re_eduscript_client/models/language_mapping_model.dart';

class LanguageMappingProvider extends ChangeNotifier {

  // [언어 매핑 테이블]
  static final Map<String, LanguageMappingModel> _languageMappings = {
    '한국어': LanguageMappingModel(
      displayName: '한국어',
      language: '한국어',
      speechCode: 'ko-KR',
      translationCode: 'ko',
      previewText: '안녕하세요! 테스트 자막입니다.',
    ),
    '영어': LanguageMappingModel(
      displayName: '영어',
      language: 'English',
      speechCode: 'en-US',
      translationCode: 'en',
      previewText: 'Hello! This is a test subtitle.',
    ),
    '일본어': LanguageMappingModel(
      displayName: '일본어',
      language: '日本語',
      speechCode: 'ja-JP',
      translationCode: 'ja',
      previewText: 'こんにちは！テスト字幕です。',
    ),
    '중국어': LanguageMappingModel(
      displayName: '중국어',
      language: '中文',
      speechCode: 'zh-CN',
      translationCode: 'zh-CN',
      previewText: '你好！这是测试字幕。',
    ),
    '독일어': LanguageMappingModel(
      displayName: '독일어',
      language: 'Deutsch',
      speechCode: 'de-DE',
      translationCode: 'de',
      previewText: 'Hallo! Dies ist ein Test-Untertitel.',
    ),
    '프랑스어': LanguageMappingModel(
      displayName: '프랑스어',
      language: 'Français',
      speechCode: 'fr-FR',
      translationCode: 'fr',
      previewText: 'Bonjour! Ceci est un sous-titre de test.',
    ),
    '스페인어': LanguageMappingModel(
      displayName: '스페인어',
      language: 'Español',
      speechCode: 'es-ES',
      translationCode: 'es',
      previewText: '¡Hola! Este es un subtítulo de prueba.',
    ),
    '이탈리아어': LanguageMappingModel(
      displayName: '이탈리아어',
      language: 'Italiano',
      speechCode: 'it-IT',
      translationCode: 'it',
      previewText: 'Ciao! Questo è un sottotitolo di prova.',
    ),
    '러시아어': LanguageMappingModel(
      displayName: '러시아어',
      language: 'Русский',
      speechCode: 'ru-RU',
      translationCode: 'ru',
      previewText: 'Привет! Это тестовые субтитры.',
    ),
    '포르투갈어': LanguageMappingModel(
      displayName: '포르투갈어',
      language: 'Português',
      speechCode: 'pt-BR',
      translationCode: 'pt',
      previewText: 'Olá! Esta é uma legenda de teste.',
    ),
    '아랍어': LanguageMappingModel(
      displayName: '아랍어',
      language: 'العربية',
      speechCode: 'ar-SA',
      translationCode: 'ar',
      previewText: 'مرحبا! هذه ترجمة تجريبية.',
    ),
    '힌디어': LanguageMappingModel(
      displayName: '힌디어',
      language: 'हिन्दी',
      speechCode: 'hi-IN',
      translationCode: 'hi',
      previewText: 'नमस्ते! यह एक परीक्षण उपशीर्षक है।',
    ),
    '태국어': LanguageMappingModel(
      displayName: '태국어',
      language: 'ภาษาไทย',
      speechCode: 'th-TH',
      translationCode: 'th',
      previewText: 'สวัสดี! นี่คือคำบรรยายทดสอบ',
    ),
    '인도네시아어': LanguageMappingModel(
      displayName: '인도네시아어',
      language: 'Bahasa Indonesia',
      speechCode: 'id-ID',
      translationCode: 'id',
      previewText: 'Halo! Ini adalah subtitle uji coba.',
    ),
    '네덜란드어': LanguageMappingModel(
      displayName: '네덜란드어',
      language: 'Nederlands',
      speechCode: 'nl-NL',
      translationCode: 'nl',
      previewText: 'Hallo! Dit is een test ondertitel.',
    ),
    '폴란드어': LanguageMappingModel(
      displayName: '폴란드어',
      language: 'Polski',
      speechCode: 'pl-PL',
      translationCode: 'pl',
      previewText: 'Cześć! To jest testowy napis.',
    ),
    '스웨덴어': LanguageMappingModel(
      displayName: '스웨덴어',
      language: 'Svenska',
      speechCode: 'sv-SE',
      translationCode: 'sv',
      previewText: 'Hej! Detta är en testundertext.',
    ),
    '핀란드어': LanguageMappingModel(
      displayName: '핀란드어',
      language: 'Suomi',
      speechCode: 'fi-FI',
      translationCode: 'fi',
      previewText: 'Hei! Tämä on testi tekstitys.',
    ),
    '덴마크어': LanguageMappingModel(
      displayName: '덴마크어',
      language: 'Dansk',
      speechCode: 'da-DK',
      translationCode: 'da',
      previewText: 'Hej! Dette er en test undertekst.',
    ),
  };

  // [Getter] 지원 언어 목록 조회
  static List<String> get supportedLanguages => _languageMappings.keys.toList();

  // [언어 설정]
  // 미리보기 텍스트 반환
  String getPreviewText(String language) {
    switch (language) {
      case '영어':
        return 'Hello! This is a test subtitle.';
      case '일본어':
        return 'こんにちは！テスト字幕です。';
      case '중국어':
        return '你好！这是测试字幕。';
      case '독일어':
        return 'Hallo! Dies ist ein Test-Untertitel.';
      case '프랑스어':
        return 'Bonjour! Ceci est un sous-titre de test.';
      case '스페인어':
        return '¡Hola! Este es un subtítulo de prueba.';
      case '이탈리아어':
        return 'Ciao! Questo è un sottotitolo di prova.';
      case '러시아어':
        return 'Привет! Это тестовые субтитры.';
      case '포르투갈어':
        return 'Olá! Esta é uma legenda de teste.';
      case '아랍어':
        return 'مرحبا! هذه ترجمة تجريبية.';
      case '힌디어':
        return 'नमस्ते! यह एक परीक्षण उपशीर्षक है।';
      case '태국어':
        return 'สวัสดี! นี่คือคำบรรยายทดสอบ';
      case '인도네시아어':
        return 'Halo! Ini adalah subtitle uji coba.';
      case '네덜란드어':
        return 'Hallo! Dit is een test ondertitel.';
      case '폴란드어':
        return 'Cześć! To jest testowy napis.';
      case '스웨덴어':
        return 'Hej! Detta är en testundertext.';
      case '핀란드어':
        return 'Hei! Tämä on testi tekstitys.';
      case '덴마크어':
        return 'Hej! Dette er en test undertekst.';
      default:
        return '안녕하세요! 텍스트 자막입니다.';
    }
  }

  // 언어 이름 반환
  String getLanguageName(String lang) {
    return _languageMappings[lang]?.language ?? ' ';
  }

  // 1) 표시명 "한국어" -> 국가 코드
  // - 입력 언어 코드 리스트 변환 (표시명 "한국어" -> 언어 코드)
  List<String> getSpeechCodesFromInput(List<String> inputLanguages) {
    return inputLanguages
        .map((lang) => _languageMappings[lang]?.speechCode ?? 'ko-KR')
        .toList();
  }

  // - 출력 언어 코드 리스트 변환 (표시명 "한국어" -> 언어 코드)
  List<String> getTranslationCodesFromOutput(List<String> outputLanguages) {
    return outputLanguages
        .map((lang) => _languageMappings[lang]?.translationCode ?? 'ko')
        .toList();
  }

  // 2) 언어 코드 -> 표시명 "한국어"
  // - STT 코드를 표시명으로 변환 (언어 코드 -> 표시명 "한국어")
  String getDisplayNameFromSpeechCode(String speechCode) {
    for (final entry in _languageMappings.entries) {
      if (entry.value.speechCode == speechCode) {
        return entry.key;
      }
    }
    return speechCode;
  }

  // - 번역 코드를 표시명으로 변환 (언어 코드 -> 표시명 "한국어)
  String getDisplayNameFromTranslationCode(String translationCode) {
    for (final entry in _languageMappings.entries) {
      if (entry.value.translationCode == translationCode) {
        return entry.key;
      }
    }
    return translationCode;
  }
}