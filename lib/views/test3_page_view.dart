import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/bukvi.dart';
import '../views/result_page_view.dart';
import '../pages/menu_page.dart';
import '../style/colors.dart';
import '../utilities/words.dart';
import '../components/background.dart';

class Test3View extends StatefulWidget {
  const Test3View({Key? key}) : super(key: key);

  @override
  State<Test3View> createState() => _Test3ViewState();
}

class _Test3ViewState extends State<Test3View> {
  final player = AudioPlayer();
  final player2 = AudioPlayer();

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

  int correct = 0;
  int count = 1;
  int incorrect = 0;

  @override
  Widget build(BuildContext context) {
    String duma = dumi.keys.elementAt(Random().nextInt(dumi.length));
    List bukvi = duma.toLowerCase().split('');
    List isglasna = [];
    getGlasni(isglasna, bukvi);

    String ednabukva = bukvi[Random().nextInt(bukvi.length)];
    String bgbukva = ednabukva;
    ednabukva = fromEngToBg(ednabukva);

    String dumaaudio = "${dumi[duma][3]}";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Къде се намира тази буква в тази дума ?',
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/bukvi/${ednabukva}.png',
                        ),
                        scale: 1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
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
              const SizedBox(height: 130),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                                  itemBuilder:
                                      (BuildContext context, int index2) {
                                    return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            if (count == 10) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ResultView(
                                                    incorrect:
                                                        incorrect.toString(),
                                                    correct: correct.toString(),
                                                  ),
                                                ),
                                              );
                                            }

                                            setState(() {
                                              if (bgbukva == bukvi[index2]) {
                                                correct++;
                                              } else {
                                                incorrect++;
                                              }
                                              count++;
                                            });
                                          },
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 25),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                              color: isglasna[index2] == 1
                                                  ? Colors.red
                                                  : Colors.blue,
                                            ),
                                            child: SizedBox(
                                              width: 100,
                                            ),
                                          ),
                                        ));
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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
