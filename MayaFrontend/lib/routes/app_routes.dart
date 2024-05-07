import 'package:flutter/material.dart';
import '../presentation/inicio_screen/inicio_screen.dart';
import '../presentation/iniciar_sesi_n_screen/iniciar_sesi_n_screen.dart';
import '../presentation/signup_screen/signup_screen.dart';
import '../presentation/traductor_screen/traductor_screen.dart';
import '../presentation/traductor_two_screen/traductor_two_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String inicioScreen = '/inicio_screen';

  static const String iniciarSesiNScreen = '/iniciar_sesi_n_screen';

  static const String signupScreen = '/signup_screen';

  static const String traductorScreen = '/traductor_screen';

  static const String traductorTwoScreen = '/traductor_two_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    inicioScreen: (context) => InicioScreen(),
    iniciarSesiNScreen: (context) => IniciarSesiNScreen(),
    signupScreen: (context) => SignupScreen(),
    traductorScreen: (context) => TraductorScreen(),
    traductorTwoScreen: (context) => TraductorTwoScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
