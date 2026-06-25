import 'package:flutter/material.dart';

import '../../core/routes/app_routes.dart';
import '../../core/services/auth/auth_service.dart';

/// Auth guard that routes users based on Firebase auth state.
///
/// Flow requirement:
/// - Splash -> AuthGuard -> Login if logged out, Dashboard placeholder if logged in.
class AuthGuard extends StatelessWidget {
  const AuthGuard({super.key, required this.authService});

  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authService.authStateChanges(),
      builder: (context, snapshot) {
        // While the stream is establishing, show a minimal loading state.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snapshot.data;

        if (user == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.login, (r) => false);
          });
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.dashboard, (r) => false);
          });
        }

        // Keep guard UI stable while navigation occurs.
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

