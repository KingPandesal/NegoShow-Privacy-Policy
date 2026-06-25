import 'package:flutter/material.dart';

import '../../../core/services/auth/auth_service.dart';
import '../auth_guard.dart';

/// Splash screen shown at app start.
///
/// After Firebase auth state is resolved, [AuthGuard] routes to Login or Dashboard.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return AuthGuard(authService: authService);
  }
}

