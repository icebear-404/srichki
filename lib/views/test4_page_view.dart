import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srichki/views/result_page_view.dart';

import '../utilities/bukvi.dart';
import '../pages/menu_page.dart';
import '../style/colors.dart';
import '../components/background.dart';

class Test4View extends StatefulWidget {
  const Test4View({Key? key}) : super(key: key);

  @override
  State<Test4View> createState() => _Test4ViewState();
}

class _Test4ViewState extends State<Test4View> {
  final player = AudioPlayer();

  int count = 1;
  int correct = 0;
  int incorrect = 0;

  String vapros = "sound/chalga.mp3";

  @override
  Widget build(BuildContext context) {
    saglasni.shuffle();
    glasni.shuffle();
    String glasnatbukva = glasni[0];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Буквата "${saglasni[0]}" се събрала с "${glasni[0]}" и се получила сричката ?',
          style: const TextStyle(
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
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 150,
                          backgroundColor: Colors.pink[600],
                          child: Text(
                            saglasni[0],
                            style: const TextStyle(
                              fontSize: 160,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 600,
                    height: 150,
                    child: Image.asset(
                      'arrow.png',
                      scale: 0.4,
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 150,
                          backgroundColor: Colors.pink[600],
                          child: Text(
                            glasni[0],
                            style: TextStyle(
                              fontSize: 160,
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
              const SizedBox(height: 130),
              //~~~~~~~
              ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  glasni.shuffle();
                  return SizedBox(
                    width: 1000,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index2) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                      if (glasnatbukva == glasni[index2]) {
                                        correct++;
                                      } else {
                                        incorrect++;
                                      }
                                      count++;
                                    });
                                  },
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
                                      color: Colors.blue,
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: Center(
                                        child: Text(
                                          saglasni[0] + '' + glasni[index2],
                                          style: const TextStyle(
                                            fontSize: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              //~~~~~~~
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
                        child: InkWell(
                          onTap: () async {
                            player.play(AssetSource(vapros));
                          },
                          child: const Icon(
                            Icons.volume_up_rounded,
                            size: 100,
                            color: AppColors.black,
                          ),
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
