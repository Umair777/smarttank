import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'dashboard.dart';
import 'login_page.dart';
import 'mqtt_service.dart';

final mqttService = MQTTService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fjvxbjazhbszlcogljlp.supabase.co',
    anonKey: 'YOUR_KEY',
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: const AuthGate(),
      home: const LoginPage(),
    );
  }
}

/// 🔐 AuthGate decides where to go
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        // While waiting for initial auth state, show a loader
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final session = Supabase.instance.client.auth.currentSession;

        if (session != null) {
          print("going to dashboard");
          return Dashboard();
        } else {
          print("going to login");
          return const LoginPage();
        }
      },
    );
  }
}
