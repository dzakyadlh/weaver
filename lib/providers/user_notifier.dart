import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weaver/models/weavee.dart';
import 'package:weaver/repositories/user_repository.dart';
import 'package:weaver/utils/supabase.dart';

part 'user_notifier.g.dart';

final supabase = supabaseClient;

@riverpod
UserRepository userRepository(Ref ref) => UserRepository(supabase: supabase);

@riverpod
class UserNotifier extends _$UserNotifier {
  late final UserRepository _userRepository;

  @override
  FutureOr<Weavee?> build() async {
    _userRepository = ref.read(userRepositoryProvider);
    supabase.auth.onAuthStateChange.listen((data) async {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() => _fetchUser());
    });
    return _fetchUser();
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _userRepository.signIn(email, password);
      return _fetchUser();
    });
  }

  Future<void> signUp(
    String email,
    String name,
    String username,
    String password,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _userRepository.signUp(email, name, username, password);
      return _fetchUser();
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _userRepository.signOut();
      return null;
    });
  }

  Future<Weavee?> _fetchUser() async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      final response =
          await supabase.from('users').select().eq('id', user.id).single();
      return Weavee.fromJson(response);
    }
    return null;
  }
}
