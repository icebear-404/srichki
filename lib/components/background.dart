import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  Widget child;
  Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.5,
          image: AssetImage(
            'backgrounds/bg3.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
