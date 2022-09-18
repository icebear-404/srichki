import 'package:flutter/material.dart';

import '../components/background.dart';
import '../pages/menu_page.dart';
import '../style/colors.dart';

class StartPageView extends StatelessWidget {
  const StartPageView({Key? key}) : super(key: key);

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
              'backgrounds/bg4.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Играя, за да зная',
              style: TextStyle(
                fontSize: 96,
                color: Colors.deepPurple[700],
                fontFamily: 'kids',
                shadows: const <Shadow>[
                  Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 5.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              child: InkWell(
                onTap: () =>
                    Navigator.popAndPushNamed(context, MenuPage.routeName),
                child: const Icon(
                  Icons.play_arrow,
                  size: 96,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
