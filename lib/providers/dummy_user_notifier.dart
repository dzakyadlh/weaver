import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weaver/models/weavee.dart';

part 'dummy_user_notifier.g.dart';

@riverpod
class DummyUserNotifier extends _$DummyUserNotifier {
  @override
  FutureOr<Weavee?> build() async {
    return await _fetchUser();
  }

  Future<Weavee?> _fetchUser() async {
    state = const AsyncValue.loading();
    final String jsonString = await rootBundle.loadString(
      'assets/dummies/user_dummy.json',
    );

    try {
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;

      // await Future.delayed(const Duration(seconds: 2));
      final userData = Weavee.fromJson(jsonMap);
      state = AsyncValue.data(userData);
      return userData;
    } catch (e, stackTrace) {
      debugPrint('Error parsing JSON: $e');
      state = AsyncValue.error(e, stackTrace);
      return null;
    }
  }
}
