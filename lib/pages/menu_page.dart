import 'package:flutter/material.dart';

import '../views/menu_page_view.dart';

class MenuPage extends StatelessWidget {
  static const routeName = '/menu';
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MenuPageView();
  }
}
