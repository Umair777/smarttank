import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final deviceProvider = StreamProvider<Map<String, dynamic>?>((ref) {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;

  if (user == null) return const Stream.empty();

  return supabase
      .from('devices')
      .stream(primaryKey: ['id'])
      .eq('owner_id', user.id)
      .map((data) => data.isEmpty ? null : data.first);
});