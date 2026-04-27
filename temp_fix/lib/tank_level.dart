import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/device_provider.dart';

class TankLevel extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceAsync = ref.watch(deviceProvider);

    return deviceAsync.when(
      data: (device) {
        final level =
        ((device?['tank_level_percent'] ?? 0) as num).toInt();

        return Stack(
          children: [
            Positioned(
              top: 510,
              left: 290,
              child: Text(
                '$level%',
                style: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.7),
                  fontFamily: 'WorkSans',
                  fontSize: 28,
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (e, _) => Text('Error: $e'),
    );
  }
}