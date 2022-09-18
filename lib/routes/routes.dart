import 'package:flutter/material.dart';

import '../pages/start_page.dart';
import '../pages/menu_page.dart';
import '../pages/test1_page.dart';
import '../pages/test2_page.dart';
import '../pages/test3_page.dart';
import '../pages/test4_page.dart';
import '../pages/test5_page.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StatPage.routeName:
        return MaterialPageRoute(builder: (_) => const StatPage());
      case MenuPage.routeName:
        return MaterialPageRoute(builder: (_) => const MenuPage());
      case Test1Page.routeName:
        return MaterialPageRoute(builder: (_) => const Test1Page());
      case Test2Page.routeName:
        return MaterialPageRoute(builder: (_) => const Test2Page());
      case Test3Page.routeName:
        return MaterialPageRoute(builder: (_) => const Test3Page());
      case Test4Page.routeName:
        return MaterialPageRoute(builder: (_) => const Test4Page());
      case Test5Page.routeName:
        return MaterialPageRoute(builder: (_) => const Test5Page());
      default:
        return MaterialPageRoute(builder: (_) => const StatPage());
    }
  }
}
