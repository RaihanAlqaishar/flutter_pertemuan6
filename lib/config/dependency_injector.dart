
// ==========================================
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../repositories/user_repository.dart';
import '../repositories/user_repository_impl.dart';
import '../repositories/post_repository.dart';
import '../repositories/post_repository_impl.dart';

class DependencyInjector extends InheritedWidget {
  // Singleton instance untuk ApiService
  static final ApiService apiService = ApiService();

  // Instance Repository
  final UserRepository userRepository;
  final PostRepository postRepository;

  DependencyInjector({
    super.key,
    required Widget child,
    UserRepository? userRepository,
    PostRepository? postRepository,
  })  : userRepository = userRepository ?? UserRepositoryImpl(apiService: apiService),
        postRepository = postRepository ?? PostRepositoryImpl(apiService: apiService),
        super(child: child);

  static DependencyInjector of(BuildContext context) {
    final DependencyInjector? result =
        context.dependOnInheritedWidgetOfExactType<DependencyInjector>();
    assert(result != null, 'No DependencyInjector found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DependencyInjector oldWidget) {
    return false;
  }
}