import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigation/app_navigator.dart' as navigator;
import 'state/app_global_state.dart';
import 'state/app_tab_controller.dart';
import 'ui/constants/dp.dart';
import 'ui/custom_behaviors/app_scroll_behavior.dart';
import 'ui/layout/app_bottom_bar.dart';
import 'ui/layout/app_drawer.dart';
import 'ui/layout/root.dart';

void main() {
  runApp(App(appTabController: AppTabController()));
}

class App extends StatelessWidget {
  final AppTabController appTabController;

  const App({
    Key key,
    this.appTabController,
  }) : super(key: key);

  static final monoThemes = <MaterialColor, ThemeData Function(Brightness)>{
    Colors.cyan: (brightness) {
      final isDark = brightness == Brightness.dark;

      final primaryColor = Colors.cyan;

      final scaffoldBackgroundColor =
          isDark ? Color(0xFF101010) : Color(0xFFF9F9F9);

      final cardColor = isDark ? Color(0xFF222222) : Color(0xFFFFFFFF);

      final bottomNavigationBarBackgroundColor = cardColor;

      return ThemeData(
        splashFactory: InkRipple.splashFactory,
        splashColor: Colors.white.withOpacity(.03),
        highlightColor: Colors.transparent,
        brightness: brightness,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        primarySwatch: primaryColor,
        appBarTheme: AppBarTheme(
          elevation: k1dp,
          color: bottomNavigationBarBackgroundColor,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: k1dp,
          backgroundColor: bottomNavigationBarBackgroundColor,
        ),
        fontFamily: 'Comfortaa',
        cardTheme: CardTheme(color: cardColor),
      );
    },
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigator.rootNavigator,
      debugShowCheckedModeBanner: false,
      theme: monoThemes[Colors.cyan](Brightness.light),
      builder: (context, widget) {
        return ScrollConfiguration(
          behavior: AppScrollBehavior(),
          child: widget,
        );
      },
      home: AppGlobalState(
        appTabController: appTabController,
        child: Scaffold(
          bottomNavigationBar: AppBottomBar(),
          drawer: AppDrawer(),
          body: Root(),
        ),
      ),
    );
  }
}
