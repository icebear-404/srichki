import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/menu_page.dart';
import '../style/colors.dart';

import '../components/background.dart';

class ResultView extends StatefulWidget {
  ResultView({
    Key? key,
    required String this.correct,
    required String this.incorrect,
  }) : super(key: key);
  String? correct;
  String? incorrect;
  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            image: AssetImage(
              'background.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
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
                      border: Border.all(color: Colors.green, width: 10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${widget.correct}',
                          style: const TextStyle(fontSize: 80),
                        ),
                        const SizedBox(height: 20),
                        const Icon(
                          Icons.check,
                          size: 150,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${widget.incorrect}',
                          style: const TextStyle(fontSize: 80),
                        ),
                        const SizedBox(height: 20),
                        const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 150,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 130),
              InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, MenuPage.routeName);
                },
                child: Image.asset('home_icon.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
