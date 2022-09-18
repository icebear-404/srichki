import 'package:flutter/material.dart';

import '../views/start_page_view.dart';

class StatPage extends StatelessWidget {
  static const routeName = '/';
  const StatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StartPageView();
  }
}
