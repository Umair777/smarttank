import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'Userbar.dart';
import 'motor_switch.dart';
import 'providers/mqtt_provider.dart';
import 'savings.dart';
import 'sensor.dart';
import 'tank_level.dart';
import 'water_animation.dart';
import 'consumption_graph.dart';
import 'login_page.dart';
import 'mqtt_service.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late MQTTService mqttService;

  @override
  void initState() {
    super.initState();

    mqttService = ref.read(mqttProvider);

    _initializeMQTT();
  }

  Future<void> _initializeMQTT() async {

    await mqttService.connect();

    mqttService.subscribeTankLevel();

    mqttService.onTankLevelReceived = (int level) {
      ref.read(tankLevelProvider.notifier).state = level;
    };
  }

  @override
  void dispose() {
    mqttService.client.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      key: scaffoldKey,

      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),

      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(1, 8, 27, 1),
        child: Column(
          children: [

            const SizedBox(height: 80),

            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/Pngegg1.png'),
            ),

            const SizedBox(height: 10),

            Text(
              Supabase.instance.client.auth.currentUser?.email ?? "",
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

                if (mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                }
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),

      body: Stack(
        children: [

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromRGBO(0, 0, 0, 1),

            child: Stack(
              children: [

                /// USER BAR
                Userbar(scaffoldKey: scaffoldKey),

                /// SENSOR STATUS
                SensorStatus(),

                /// WATER SAVINGS
                WaterSaving(),

                /// WATER CONSUMPTION GRAPH
                WaterConsumption(),

                /// MOTOR SWITCH
                MotorSwitch(),

                /// WATER ANIMATION
                WaterUpdater(),

                /// TANK LEVEL
                TankLevel(),
              ],
            ),
          ),

          /// QUICK LOGOUT BUTTON (optional)
          Positioned(
            top: 100,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              onPressed: () async {

                await Supabase.instance.client.auth.signOut();

                if (mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}