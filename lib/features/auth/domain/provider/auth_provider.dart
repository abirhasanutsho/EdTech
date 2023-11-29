import 'package:edtech/features/auth/domain/controller/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider =
    ChangeNotifierProvider<AuthController>((ref) => AuthController());
