import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'controller.dart';
import 'functions.dart';

FlutterTts flutterTts = FlutterTts();
SpeechToText speechToText = SpeechToText();

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  // @override
  // void initState()  {
  //   // TODO: implement initState
  //   super.initState();
  //    chatGPTAPI("what is dart ?");
  // }
  String pranjal = "give me ratting";
  bool firsttime = false;
  bool micpressed = false;
  String myreply = '';
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AvatarGlow(
        endRadius: 75,
        repeat: true,
        animate: micpressed,
        showTwoGlows: true,
        glowColor: Color(0xffDF610B),
        duration: Duration(milliseconds: 1300),
        repeatPauseDuration: Duration(milliseconds: 100),
        child: GestureDetector(
          onTapDown: (details) async {
            if (!micpressed) {
              var available = await speechToText.initialize();
              if (available) {
                setState(() {
                  micpressed = true;
                  speechToText.listen(
                    onResult: (result) {
                      setState(() {
                        myreply = result.recognizedWords;
                      });
                    },
                  );
                });
              }
            }
          },
          onTapUp: (details) async {
            setState(() {
              micpressed = false;
            });
            speechToText.stop();

            await chatGPTAPIcheck(
                "compair my answer with your answer $myreply,question is = $hrquestion and give correct explanitaions(rate my answer with number%)(only in 30 words)");
            setState(() {});
            speak(checkanswer);
          },
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Color(0xffDF610B),
            child: Icon(
              micpressed ? Icons.mic : Icons.mic_none,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height * 0.5,
              child: Get.put(mycontroller()).bolnaa.value
                  ? Image.asset('assets/hr_ai_img.jpg')
                  : Image.asset('assets/hr_ai_dark.gif'),
            ),
            Container(
              height: height * 0.24,
              //color: Colors.amber,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hrquestion,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(myreply),
                    SizedBox(
                      height: 10,
                    ),
                    Text(checkanswer),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await chatGPTAPI(firsttime
                    ? "next question, but don't repeat previous question(in only 20 words)(only oral questions)"
                    : "only one hard interview viva question in html (in only 20 words)(only oral questions)");
                setState(() {});
                firsttime = true;
                print(firsttime);
                print(Get.put(mycontroller()).bolnaa.value);
                //answer = '';

                speak(hrquestion);
                setState(() {
                  checkanswer = '';
                  myreply = '';
                });
              },
              child: Text(!firsttime ? "Start Interview" : 'Next Question'),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Text('Hold to Answer the Question')
          ],
        ),
      ),
    );
  }
}
