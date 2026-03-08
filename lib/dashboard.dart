import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smarttank/widgets/tank_settings_dialog.dart';
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
import 'drawer.dart';

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

      drawer: const AppDrawer(),

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
                GestureDetector(
                  onLongPress: () {
                    showTankSettingsDialog(context);
                  },
                  child: WaterUpdater(),
                ),

                /// TANK LEVEL
                TankLevel(),
              ],
            ),
          ),


        ],
      ),
    );
  }
}