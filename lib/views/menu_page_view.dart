import 'package:flutter/material.dart';
import 'package:srichki/pages/test1_page.dart';

import '../pages/test2_page.dart';
import '../pages/test3_page.dart';
import '../pages/test4_page.dart';
import '../pages/test5_page.dart';

class MenuPageView extends StatelessWidget {
  const MenuPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            'Избери тест:',
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
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.transparent,
                child: CircleAvatar(
                    radius: 170,
                    backgroundColor: Colors.transparent,
                    backgroundImage: const AssetImage('sun2.png'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '  Тест 1',
                          style: TextStyle(fontSize: 50, color: Colors.purple),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Test1Page.routeName);
                            },
                            icon: const Icon(
                              Icons.play_arrow,
                              size: 43,
                              color: Colors.purple,
                            )),
                      ],
                    )),
              ),
              // --
              Material(
                color: Colors.transparent,
                child: CircleAvatar(
                  radius: 170,
                  backgroundColor: Colors.transparent,
                  backgroundImage: const AssetImage('sun2.png'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '  Тест 2',
                        style: TextStyle(fontSize: 50, color: Colors.purple),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Test2Page.routeName);
                          },
                          icon: const Icon(
                            Icons.play_arrow,
                            size: 43,
                            color: Colors.purple,
                          )),
                    ],
                  ),
                ),
              ),
              // --
              Material(
                color: Colors.transparent,
                child: CircleAvatar(
                    radius: 170,
                    backgroundColor: Colors.transparent,
                    backgroundImage: const AssetImage('sun2.png'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '  Тест 3',
                          style: TextStyle(fontSize: 50, color: Colors.purple),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Test3Page.routeName);
                            },
                            icon: const Icon(
                              Icons.play_arrow,
                              size: 43,
                              color: Colors.purple,
                            )),
                      ],
                    )),
              ),
              // --
              Material(
                color: Colors.transparent,
                child: CircleAvatar(
                    radius: 170,
                    backgroundColor: Colors.transparent,
                    backgroundImage: const AssetImage('sun2.png'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '  Тест 4',
                          style: TextStyle(fontSize: 50, color: Colors.purple),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Test4Page.routeName);
                            },
                            icon: const Icon(
                              Icons.play_arrow,
                              size: 43,
                              color: Colors.purple,
                            )),
                      ],
                    )),
              ),
              // --
              Material(
                color: Colors.transparent,
                child: CircleAvatar(
                  radius: 170,
                  backgroundColor: Colors.transparent,
                  backgroundImage: const AssetImage('sun2.png'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '  Тест 5',
                        style: TextStyle(fontSize: 50, color: Colors.purple),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Test5Page.routeName);
                        },
                        icon: const Icon(
                          Icons.play_arrow,
                          size: 43,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
