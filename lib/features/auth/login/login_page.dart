import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/services/auth/auth_service.dart';
import '../../../shared/widgets/error_dialog.dart';
import '../../../shared/widgets/loading_indicator.dart';
import '../../../shared/widgets/password_text_field.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/primary_button.dart';
import '../../../shared/widgets/secondary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isLoading = true);
    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      // Security: do not log password.
      await _authService.signInWithEmailAndPassword(email: email, password: password);

      // Navigation handled by AuthGuard after auth state updates.
    } on FirebaseAuthException catch (e) {
      final message = _mapFirebaseAuthErrorToMessage(e);
      if (mounted) {
        await ErrorDialog.show(
          context: context,
          title: 'Sign in failed',
          message: message,
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String _mapFirebaseAuthErrorToMessage(FirebaseAuthException e) {
    // Avoid leaking sensitive details.
    switch (e.code) {
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'user-not-found':
        return 'No account found for this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      default:
        return 'Unable to sign in. Please try again.';
    }
  }

  String? _validateEmail(String? value) {
    final v = value?.trim() ?? '';
    if (v.isEmpty) return 'Email is required.';
    if (!v.contains('@')) return 'Enter a valid email.';
    return null;
  }

  String? _validatePassword(String? value) {
    final v = value ?? '';
    if (v.isEmpty) return 'Password is required.';
    if (v.length < 6) return 'Password must be at least 6 characters.';
    return null;
  }

  Future<void> _signInWithGoogle() async {
    setState(() => _isLoading = true);
    try {
      await _authService.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      final message = _mapFirebaseAuthErrorToMessage(e);
      if (mounted) {
        await ErrorDialog.show(context: context, title: 'Google sign-in failed', message: message);
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 8),
                AppTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                const SizedBox(height: 12),
                PasswordTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  validator: _validatePassword,
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  label: 'Sign In',
                  onPressed: _submit,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 12),
                SecondaryButton(
                  label: 'Sign in with Google',
                  onPressed: _isLoading ? null : _signInWithGoogle,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.forgotPassword);
                  },
                  child: const Text('Forgot password?'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.register);
                  },
                  child: const Text('Create an account'),
                ),
                if (_isLoading) const SizedBox(height: 12),
                if (_isLoading) const LoadingIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

