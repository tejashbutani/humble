import 'package:humble/api_service.dart';
import 'package:humble/user_model.dart';

class UserDataProcessor {
  APIService apiService;

  UserDataProcessor(this.apiService);

  Future<List<User>> process() async {
    List<User> data = await apiService.fetchData();
    // Process the data
    return data;
  }
}
