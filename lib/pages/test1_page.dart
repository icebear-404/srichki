import 'package:flutter/material.dart';
import '../views/test1_page_view.dart';

class Test1Page extends StatelessWidget {
  static const routeName = '/test1';
  const Test1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Test1View();
  }
}
