import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/result_page_view.dart';
import '../pages/menu_page.dart';
import '../style/colors.dart';
import '../components/background.dart';
import '../utilities/bukvi.dart';
import '../utilities/words.dart';

class Test2View extends StatefulWidget {
  Test2View({Key? key}) : super(key: key);

  @override
  State<Test2View> createState() => _Test2ViewState();
}

class _Test2ViewState extends State<Test2View> {
  final player = AudioPlayer();
  final player2 = AudioPlayer();
  int correct = 0;
  int incorrect = 0;
  int count = 1;

  void getGlasni(List isglasna, List bukvi) {
    int x = 0;
    for (int i = 0; i < bukvi.length; i++) {
      for (int j = 0; j < glasni.length; j++) {
        if (bukvi[i] == glasni[j]) {
          isglasna.add(1);

          x++;
        }
      }
      if (x == 0) {
        isglasna.add(0);
      } else {
        x = 0;
      }
    }
  }

  List randum(
    List isglasna,
    String duma,
    int duma1,
    int duma2,
    int lastglasna,
  ) {
    List answers = [
      ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 1000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: dumi[duma][0],
                    itemBuilder: (BuildContext context, int index2) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: const EdgeInsets.only(left: 25),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            color: isglasna[index2] == 1
                                ? Colors.red
                                : Colors.blue,
                          ),
                          child: isglasna[index2] == 1 && lastglasna == index2
                              ? SizedBox(
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      duma[index2],
                                      style: const TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  width: 100,
                                ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30),
                CircleAvatar(
                  radius: 35,
                  child: IconButton(
                    onPressed: () {
                      if (count == 10) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ResultView(
                              correct: correct.toString(),
                              incorrect: incorrect.toString(),
                            ),
                          ),
                        );
                      }
                      setState(() {
                        correct++;
                        count++;
                      });
                    },
                    icon: const Icon(Icons.check),
                  ),
                )
              ],
            ),
          );
        },
      ),
      ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 1000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: duma1,
                    itemBuilder: (BuildContext context, int index2) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: const EdgeInsets.only(left: 25),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: index2 % 3 == 0 ? Colors.red : Colors.blue,
                          ),
                          child: lastglasna == index2
                              ? SizedBox(
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      duma[index2],
                                      style: const TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  width: 100,
                                ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30),
                CircleAvatar(
                  radius: 35,
                  child: IconButton(
                    onPressed: () {
                      if (count == 10) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ResultView(
                              correct: correct.toString(),
                              incorrect: incorrect.toString(),
                            ),
                          ),
                        );
                      }
                      setState(() {
                        incorrect++;
                        count++;
                      });
                    },
                    icon: const Icon(Icons.check),
                  ),
                )
              ],
            ),
          );
        },
      ),
      ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 1000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: duma2,
                    itemBuilder: (BuildContext context, int index2) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: const EdgeInsets.only(left: 25),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: index2 % 2 == 0 ? Colors.red : Colors.blue,
                          ),
                          child: lastglasna == index2
                              ? SizedBox(
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      duma[index2],
                                      style: const TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  width: 100,
                                ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30),
                CircleAvatar(
                  radius: 35,
                  child: IconButton(
                    onPressed: () {
                      if (count == 10) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ResultView(
                              correct: correct.toString(),
                              incorrect: incorrect.toString(),
                            ),
                          ),
                        );
                      }
                      setState(() {
                        incorrect++;
                        count++;
                      });
                    },
                    icon: const Icon(Icons.check),
                  ),
                )
              ],
            ),
          );
        },
      ),
    ];
    answers.shuffle();
    return answers;
  }

  @override
  Widget build(BuildContext context) {
    String duma = dumi.keys.elementAt(Random().nextInt(dumi.length));
    int duma1 = duma.length + Random().nextInt(2);
    int duma2 = duma.length + Random().nextInt(2);

    List bukvi = duma.toLowerCase().split('');

    List isglasna = [];
    int lastglasna = 0;

    getGlasni(isglasna, bukvi);

    for (int i = 0; i < isglasna.length; i++) {
      if (isglasna[i] == 1) {
        lastglasna = i;
      }
    }

    String dumaaudio = "${dumi[duma][3]}";

    print('--${count}--');
    print(bukvi);
    print('-------');

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Кой модел отговаря на думата ?',
          style: TextStyle(
            fontSize: 40,
            color: Colors.black,
          ),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('back_arrow.png')),
        actions: [
          InkWell(
              onTap: () {
                Navigator.popAndPushNamed(context, MenuPage.routeName);
              },
              child: Image.asset('home_icon.png')),
        ],
      ),
      body: Background(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(height: 130),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 600,
                    height: 300,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 18,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all(width: 1),
                      image: DecorationImage(
                        image: AssetImage(
                          dumi[duma][1],
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  Container(
                    width: 150,
                    height: 150,
                    child: InkWell(
                      onTap: () async {
                        player.play(AssetSource(dumaaudio));
                      },
                      child: const Icon(
                        Icons.volume_up_rounded,
                        size: 150,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...randum(isglasna, duma, duma1, duma2, lastglasna),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 200,
                        height: 100,
                        child: Center(
                          child: Text(
                            '${count}/10',
                            style: GoogleFonts.chicle(
                              fontSize: 100,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 150,
                        height: 100,
                        child: const Icon(
                          Icons.volume_up_rounded,
                          size: 100,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
