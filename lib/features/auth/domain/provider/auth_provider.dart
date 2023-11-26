import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/auth_controller.dart';
import '../repositories/repositories.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(); // You can replace this with any implementation.
});

final authControllerProvider = Provider<AuthController>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository);
});