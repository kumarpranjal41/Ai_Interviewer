import 'dart:convert';
import 'package:ai/controller.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

final List<Map<String, String>> messages = [];
final List<Map<String, String>> messages2 = [];
String hrquestion = '';
String checkanswer = '';
const String OpenAiKey = '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';

//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
//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
Future<String> chatGPTAPI(String prompt) async {
  messages.add({
    'role': 'user',
    'content': prompt,
  });
  try {
    final res = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $OpenAiKey',
      },
      body: jsonEncode(
          {"model": "gpt-3.5-turbo", "messages": messages, "max_tokens": 100}),
    );

    if (res.statusCode == 200) {
      String content = jsonDecode(res.body)['choices'][0]['message']['content'];
      content = content.trim();

      // messages.add({
      //   'role': 'assistant',
      //   'content': content,
      // });
      hrquestion = content;
      print(content);
     // messages.clear();
      return content;
    }
    return 'An internal error occurred';
  } catch (e) {
    return e.toString();
  }
}

///
Future<String> chatGPTAPIcheck(String prompt) async {
  messages2.add({
    'role': 'user',
    'content': prompt,
  });
  try {
    final res = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $OpenAiKey',
      },
      body: jsonEncode(
          {"model": "gpt-3.5-turbo", "messages": messages2, "max_tokens": 100}),
    );

    if (res.statusCode == 200) {
      String content = jsonDecode(res.body)['choices'][0]['message']['content'];
      content = content.trim();

      // messages.add({
      //   'role': 'assistant',
      //   'content': content,
      // });
      checkanswer = content;
      print(content);
      messages2.clear();
      return content;
    }
    return 'An internal error occurred';
  } catch (e) {
    return e.toString();
  }
}

///text to speech//
FlutterTts flutterTts = FlutterTts();
Future<void> speak(String text) async {
  await flutterTts.setLanguage("en-US");

  await flutterTts.setSpeechRate(0.3);

  await flutterTts.setVolume(1.0);

  await flutterTts.setPitch(1.0);

  await flutterTts.speak(text);
}

//text to s;peech male//

ai_pressed() {}
