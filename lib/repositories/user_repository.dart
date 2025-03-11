import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weaver/utils/retry.dart';

class UserRepository {
  final SupabaseClient supabase;

  UserRepository({required this.supabase});

  Future<dynamic> signIn(String email, String password) async {
    try {
      final res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      print(res);
      return res;
    } catch (e) {
      print('error');
      print(e);
      throw Exception('Failed to sign in: $e');
    }
  }

  Future<dynamic> signUp(
      String email, String name, String username, String password) async {
    try {
      return retry(() async {
        final res = await supabase.auth.signUp(
          email: email,
          password: password,
        );

        final userId = res.user?.id;
        if (userId != null) {
          await supabase.from('users').insert({
            'id': userId,
            'email': email,
            'name': name,
            'username': username,
          });
        }

        return res;
      });
    } catch (e) {
      throw Exception('Failed to sign up: $e');
    }
  }

  Future<dynamic> signOut() async {
    try {
      return retry(() async {
        final res = await supabase.auth.signOut();
        return res;
      });
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }
}
