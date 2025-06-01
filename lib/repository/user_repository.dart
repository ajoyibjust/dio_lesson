import 'package:dio_lesson/data/dio_client.dart';
import 'package:dio_lesson/models/user_model.dart';

class UserRepository {
  final DioClient dioClient;

  UserRepository(this.dioClient);

  Future<List<User>> fetchUsers() async {
    final response = await dioClient.dio.get('/users');
    final List data = response.data;
    return data.map((json) => User.fromJson(json)).toList();
  }
}
