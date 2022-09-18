import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srichki/pages/menu_page.dart';
import 'package:srichki/style/colors.dart';
import 'package:srichki/views/result_page_view.dart';

import '../components/background.dart';
import '../utilities/bukvi.dart';

class Test5View extends StatefulWidget {
  Test5View({Key? key}) : super(key: key);

  @override
  State<Test5View> createState() => _Test5ViewState();
}

class _Test5ViewState extends State<Test5View> {
  int count = 0;

  int correct = 0;

  int incorrect = 0;

  List randumi(List glasni, List saglasni) {
    List otgovori = [
      InkWell(
        onTap: () {
          if (count == 10) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultView(
                  incorrect: incorrect.toString(),
                  correct: correct.toString(),
                ),
              ),
            );
          }
          setState(() {
            count++;
            correct++;
          });
        },
        child: InkWell(
          onTap: () {
            if (count == 10) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultView(
                    incorrect: incorrect.toString(),
                    correct: correct.toString(),
                  ),
                ),
              );
            }
            setState(() {
              count++;
              correct++;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            width: 200,
            height: 200,
            color: Colors.purple,
            child: Center(
              child: Text(
                '${saglasni[0]}${glasni[0]}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          if (count == 10) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultView(
                  incorrect: incorrect.toString(),
                  correct: correct.toString(),
                ),
              ),
            );
          }
          setState(() {
            count++;
            incorrect++;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          width: 200,
          height: 200,
          color: Colors.purple,
          child: Center(
            child: Text(
              '${saglasni[0]}${glasni[4]}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 60, color: Colors.white),
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          if (count == 10) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultView(
                  incorrect: incorrect.toString(),
                  correct: correct.toString(),
                ),
              ),
            );
          }
          setState(() {
            count++;
            incorrect++;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          width: 200,
          height: 200,
          color: Colors.purple,
          child: Center(
            child: Text(
              '${saglasni[0]}${glasni[3]}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 60, color: Colors.white),
            ),
          ),
        ),
      ),
    ];
    // otgovori.shuffle();
    return otgovori;
  }

  @override
  Widget build(BuildContext context) {
    saglasni.shuffle();
    glasni.shuffle();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Коя е вярната сричка ?',
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
            child: Image.asset('home_icon.png'),
          ),
        ],
      ),
      body: Background(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 130),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 300,
                        height: 300,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 140,
                              backgroundColor: Colors.pink[600],
                              child: Text(
                                '${saglasni[0]}',
                                style: const TextStyle(
                                  fontSize: 140,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        width: 300,
                        height: 200,
                        child: Transform.rotate(
                          angle: 6,
                          child: Image.asset('arrow.png'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 300,
                        height: 200,
                        child: Image.asset('arrow.png'),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 300,
                        height: 200,
                        child: Transform.rotate(
                          angle: -6,
                          child: Image.asset('arrow.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 90,
                        backgroundColor: Colors.pink,
                        child: Text(
                          '${glasni[0]}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 60),
                        ),
                      ),
                      SizedBox(height: 50),
                      CircleAvatar(
                        radius: 90,
                        backgroundColor: Colors.pink,
                        child: Text(
                          '${glasni[1]}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 60),
                        ),
                      ),
                      SizedBox(height: 50),
                      CircleAvatar(
                        radius: 90,
                        backgroundColor: Colors.pink,
                        child: Text(
                          '${glasni[2]}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 60),
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 50),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [...randumi(glasni, saglasni)],
                  ),
                ],
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
