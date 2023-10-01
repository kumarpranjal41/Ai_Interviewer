import 'dart:convert';
import 'package:ai/controller.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

final List<Map<String, String>> messages = [];
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
      return content;
    }
    return 'An internal error occurred';
  } catch (e) {
    return e.toString();
  }
}

///
Future<String> chatGPTAPIcheck(String prompt) async {
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
      checkanswer = content;
      print(content);
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
  await flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});

  await flutterTts.setPitch(1.0);
  Get.put(mycontroller()).bolnaa.value = true;
  await flutterTts.speak(text);
  Get.put(mycontroller()).bolnaa.value = false;
}

//text to s;peech male//


