// ==========================================
// LATIHAN 1b: Interface PostRepository
// ==========================================
import '../models/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}