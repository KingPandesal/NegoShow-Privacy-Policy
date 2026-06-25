import 'package:flutter/material.dart';

/// Dashboard placeholder only.
///
/// Replace with your app's authenticated home.
class DashboardPlaceholderPage extends StatelessWidget {
  const DashboardPlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: const Center(
        child: Text('Dashboard placeholder'),
      ),
    );
  }
}

