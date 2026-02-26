import 'dart:async';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTService {
  late MqttServerClient client;

  Future<void> connect() async {
    client = MqttServerClient('broker.hivemq.com', '');
    client.port = 1883;
    client.keepAlivePeriod = 20;
    client.logging(on: false);

    client.onConnected = () {
      print('MQTT Connected');
    };

    client.onDisconnected = () {
      print('MQTT Disconnected');
    };

    final connMessage = MqttConnectMessage()
        .withClientIdentifier('smarttank_flutter')
        .startClean();

    client.connectionMessage = connMessage;

    try {
      await client.connect();
    } catch (e) {
      print('MQTT Connection Failed: $e');
      client.disconnect();
    }
  }

  void publishMotorState(bool isOn) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(isOn ? "ON" : "OFF");

    client.publishMessage(
      'smarttank/motor',
      MqttQos.atLeastOnce,
      builder.payload!,
    );

    print("Published: ${isOn ? "ON" : "OFF"}");
  }
}