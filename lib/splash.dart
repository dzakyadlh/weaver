import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weaver/providers/user_notifier.dart';
import 'package:weaver/theme.dart';

class Splash extends ConsumerWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 2), () {
      final user = ref.read(userNotifierProvider);
      if (user.hasValue) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/dashboard', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/landing', (route) => false);
      }
    });

    return Scaffold(
      backgroundColor: backgroundPrimaryColor,
      body: Center(
        child: Image.asset(
          'assets/images/ado.jpg',
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.width * 0.6,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
