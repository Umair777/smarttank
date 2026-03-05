import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'dashboard.dart';
import 'login_page.dart';
// import 'mqtt_service.dart';
//
// final mqttService = MQTTService();
// url: 'https://fjvxbjazhbszlcogljlp.supabase.co',
// anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZqdnhiamF6aGJzemxjb2dsamxwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzI1NzY0NDQsImV4cCI6MjA4ODE1MjQ0NH0.JiXBqMywjlWYuqphjBiAqxCTlLAnUFwT-1zKJCGDSpc',

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize Supabase
  await Supabase.initialize(
    url: 'https://yljggigahlagdihhycfj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlsamdnaWdhaGxhZ2RpaGh5Y2ZqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzI3MDcwNTMsImV4cCI6MjA4ODI4MzA1M30.NeGRlQv-T-OGW4iqJPLV2T-2uPQxDNz0r9GHLAG8F-g',
  );

 //  // ✅ Connect MQTT
 // await mqttService.connect();
 //  mqttService.subscribeTankLevel();

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
        fontFamily: 'WorkSans',
      ),
      home: const AuthGate(), // 🔥 IMPORTANT
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

        final session = Supabase.instance.client.auth.currentSession;

        print("Auth stream triggered");
        print("Current session: $session");

        if (session != null) {
          print("session active → dashboard");
          // return Dashboard();
          return const LoginPage();
        } else {
          print("session null → login");
          return const LoginPage();
        }
      },
    );
  }
}
