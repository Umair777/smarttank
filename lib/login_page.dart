import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signIn() async {
    setState(() => isLoading = true);

    try {
      await Supabase.instance.client.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      print("Login success");

      // 🚀 DO NOT navigate manually
      // AuthGate will automatically rebuild and go to Dashboard

    } catch (e) {
      print("Login error: $e");

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login Failed")),
        );
      }
    }

    if (mounted) {
      setState(() => isLoading = false);
    }
  }

  Future<void> signUp() async {
    setState(() => isLoading = true);

    try {
      await Supabase.instance.client.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Signup successful. Check email.")),
        );
      }

    } catch (e) {
      print("Signup error: $e");

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Signup Failed")),
        );
      }
    }

    if (mounted) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("LoginPage build called");

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white, // FORCE WHITE
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  const Text(
                    "SmartTank Login",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // FORCE VISIBLE COLOR
                    ),
                  ),

                  const SizedBox(height: 40),

                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : signIn,
                      child: isLoading
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : const Text("Login"),
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextButton(
                    onPressed: isLoading ? null : signUp,
                    child: const Text("Create Account"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
