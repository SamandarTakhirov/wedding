import 'package:flutter/material.dart';

import 'constants/app_colors.dart';
import 'router/app_route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            selectionColor: AppColors.whiteBlue,
            selectionHandleColor: AppColors.blue,
          ),
        ),
        title: 'TaklifnomaVIP',
        routerConfig: router,
      );
}
