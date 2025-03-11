import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weaver/pages/dashboard/dashboard.dart';
import 'package:weaver/pages/landing/landing.dart';
import 'package:weaver/pages/sign_in/sign_in.dart';
import 'package:weaver/pages/sign_up/sign_up.dart';
import 'package:weaver/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Supabase.initialize(
    url: '${dotenv.env['SUPABASE_PROJECT_URL']}',
    anonKey: '${dotenv.env['SUPABASE_ANON_KEY']}',
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weaver',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Dashboard(),
        '/landing': (context) => const Landing(),
        '/sign_in': (context) => const SignIn(),
        '/sign_up': (context) => const SignUp(),
        '/dashboard': (context) => const Dashboard(),
      },
    );
  }
}
