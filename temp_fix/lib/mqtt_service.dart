// import 'package:intl/intl.dart';
// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:mqtt_client/mqtt_server_client.dart';
//
// class MQTTService {
//   late MqttServerClient client;
//
//   // 🔹 Callback variable
//   Function(int)? onTankLevelReceived;
//
//   Future<void> connect() async {
//     client = MqttServerClient('broker.hivemq.com', '');
//     client.port = 1883;
//     client.keepAlivePeriod = 20;
//
//     final connMessage = MqttConnectMessage()
//         .withClientIdentifier('smarttank_flutter')
//         .startClean();
//
//     client.connectionMessage = connMessage;
//
//     try {
//       await client.connect();
//       print('MQTT Connected');
//     } catch (e) {
//       print('MQTT Failed: $e');
//       client.disconnect();
//     }
//   }
//
//   // 🔹 Separate subscribe function
//   void subscribeTankLevel() {
//     client.subscribe('smarttank/level', MqttQos.atLeastOnce);
//
//     client.updates!.listen((events) {
//       final MqttPublishMessage recMess =
//       events[0].payload as MqttPublishMessage;
//
//       final payload = MqttPublishPayload.bytesToStringAsString(
//           recMess.payload.message);
//
//       print("Received tank level: $payload");
//       // For data parshing such the level value
//       final numberOnly = RegExp(r'\d+').firstMatch(payload);
//       int level = numberOnly != null
//           ? int.parse(numberOnly.group(0)!)
//           : 0;
//       print ("parsed level : $level");
//
//       // 🔹 Call callback if registered
//       if (onTankLevelReceived != null) {
//         onTankLevelReceived!(level);
//       }
//     });
//   }
//
//   void publishMotorState(bool isOn) {
//     final builder = MqttClientPayloadBuilder();
//
//     // Get current time
//     final now = DateTime.now();
//
//     // Format date + time
//     final formattedTime =
//     DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
//
//     final message =
//         "${isOn ? "ON" : "OFF"} | $formattedTime";
//
//     builder.addString(message);
//
//     client.publishMessage(
//       'smarttank/motor',
//       MqttQos.atLeastOnce,
//       builder.payload!,
//     );
//
//     print("Published: $message");
//   }
// }