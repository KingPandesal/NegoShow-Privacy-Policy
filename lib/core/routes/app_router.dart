import 'package:flutter/material.dart';

import '../../features/auth/forgot_password/forgot_password_page.dart';
import '../../features/auth/login/login_page.dart';
import '../../features/auth/register/register_page.dart';
import '../../features/auth/splash/splash_page.dart';
import '../../features/home/dashboard/dashboard_placeholder_page.dart';
import 'app_routes.dart';

/// Routes are defined in one place for maintainability.
class AppRouter {
  const AppRouter();

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
      case AppRoutes.login:
      case AppRoutes.register:
      case AppRoutes.forgotPassword:
      case AppRoutes.dashboard:
        return _buildRoute(settings);
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashPage(),
        );
    }
  }

  Route<dynamic> _buildRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashPage(),
        );
      case AppRoutes.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginPage(),
        );
      case AppRoutes.register:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RegisterPage(),
        );
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ForgotPasswordPage(),
        );
      case AppRoutes.dashboard:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DashboardPlaceholderPage(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashPage(),
        );
    }
  }
}

