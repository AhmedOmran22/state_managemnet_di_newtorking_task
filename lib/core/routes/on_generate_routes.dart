import 'package:flutter/material.dart';
import 'package:state_managemnet_di_newtorking_task/core/routes/app_routes.dart';
import 'package:state_managemnet_di_newtorking_task/features/home/presentation/views/home_view.dart';

import '../../features/auth/presentation/views/login_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => const HomeView());

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text("No route defined for ${settings.name}")),
        ),
      );
  }
}
