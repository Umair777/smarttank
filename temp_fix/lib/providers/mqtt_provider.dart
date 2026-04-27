// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../mqtt_service.dart';
//
// final mqttProvider = Provider<MQTTService>((ref) {
//   final service = MQTTService();
//
//   // Automatically dispose when no longer used
//   ref.onDispose(() {
//     service.client.disconnect();
//   });
//
//   return service;
// });