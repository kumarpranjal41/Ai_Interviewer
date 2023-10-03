import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'Details.dart';
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
  bool stop = true;

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
            flutterTts.pause();
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

            count == 0
                ? ()
                : count == 1
                    ? ()
                    : count == 2
                        ? ()
                        : count == 3
                            ? ()
                            : count > 12
                                ? ()
                                : await chatGPTAPIcheck(
                                    "compair my answer with your answer $myreply,question is = $hrquestion and give correct explanitaions(rate my answer with number%)(only in 30 words)");
            setState(() {});
            count == 1
                ? speak("nice introduction , lets move on next")
                : speak(checkanswer);
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
              child: stop
                  ? Image.asset('assets/hr_ai_dark.gif')
                  : Image.asset('assets/hr_ai_img.jpg'),
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
                if (count == 0) {
                  setState(() {
                    stop = false;
                  });
                  await speak(
                      "hello $skill1main , tet's start your interview \n introduce your self");
                  setState(() {
                    stop = true;
                  });
                }
                if (count == 1) {
                  speak(
                      "so , as you mentioned in your resume you are having good skills in $skill2main , $skill3main , $skill4main , $skill5main \n am i right?");
                }
                if (count == 2) {
                  speak(
                      "let's start your interview ,with Questions , you can respond it by holding mic, or can go for next question");
                }
                if (count > 2 && count <= 12) {
                  await chatGPTAPI(firsttime
                      ? "next question (but don't repeat previous question)(in only 20 words)(only oral questions)"
                      : "only one hard interview viva question in $skill2main or $skill3main or $skill4main or $skill5main (in only 20 words)(only oral questions)");
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
                }
                if (count > 13) {
                  speak(
                      "Thankyou $skill1main your interview is completed , and result will be decliered soon , You can move to HR round");
                }
                count++;
                setState(() {});
                print(count);
              },
              child: Text(count == 0
                  ? 'Start'
                  : count == 1
                      ? 'Next'
                      : count == 2
                          ? "Yes ma'am"
                          : count == 3
                              ? "Ok ma'am"
                              : (count > 2 && count <= 12)
                                  ? "Next Question"
                                  : (count > 12)
                                      ? "Interview Complited"
                                      : ""),
            ),
            //!firsttime ? "Start Interview" : 'Next Question'
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
