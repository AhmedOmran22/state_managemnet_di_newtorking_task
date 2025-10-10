import 'package:flutter/material.dart';
import 'package:state_managemnet_di_newtorking_task/core/constants/constants.dart';
import 'package:state_managemnet_di_newtorking_task/core/services/prefs.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/on_generate_routes.dart';
import 'core/themes/dark_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: _handleInitialRoute(),
    );
  }

  String _handleInitialRoute() {
    final accessToken = Prefs.getString(kAccessToken);
    if (accessToken != null && accessToken.isNotEmpty) {
      return AppRoutes.home;
    }
    return AppRoutes.login;
  }
}
