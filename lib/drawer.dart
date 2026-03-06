import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Supabase.instance.client.auth.currentUser;

    return Drawer(
      backgroundColor: const Color.fromRGBO(1, 8, 27, 1),

      child: Column(
        children: [

          const SizedBox(height: 80),

          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/Pngegg1.png'),
          ),

          const SizedBox(height: 15),

          Text(
            user?.email ?? "umair@gmail.com",
            style: const TextStyle(color: Colors.white),
          ),

          const SizedBox(height: 40),

          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text(
              "Tank Settings",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.water_drop, color: Colors.white),
            title: const Text(
              "Water Parameters",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),

          const Spacer(),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () async {

              await Supabase.instance.client.auth.signOut();

              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginPage(),
                  ),
                );
              }
            },
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}