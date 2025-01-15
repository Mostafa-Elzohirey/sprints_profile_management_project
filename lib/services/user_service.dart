import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class UserService {
  final Dio _dio = Dio();
  final String endpoint = 'https://jsonplaceholder.typicode.com/users';

  // Get all users with error handling and caching
  Future<List<UserModel>> getUsers() async {
    List<UserModel> users = [];
    try {
      // Check cache first
      final prefs = await SharedPreferences.getInstance();
      final cachedData = prefs.getString('userData');

      if (cachedData != null) {
        final decoded = jsonDecode(cachedData) as List;
        return decoded.map((json) => UserModel.fromJson(json)).toList();
      }

      // If no cache, fetch from API
      final response = await _dio.get(endpoint);
      if (response.statusCode == 200) {
        // Cache the new data
        await prefs.setString('userData', jsonEncode(response.data));
        return (response.data as List)
            .map((json) => UserModel.fromJson(json))
            .toList();
      }
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      throw Exception('Failed to load users: ${e.toString()}');
    }
    return users;
  }

  // Create new user
  Future<UserModel> createUser(UserModel user) async {
    try {
      final response = await _dio.post(endpoint, data: user.toJson());
      if (response.statusCode == 200) {
        await _updateCache(user);
        return UserModel.fromJson(response.data);
      }
      throw Exception('Failed to create user');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }



  // Update cache after modifications
  Future<void> _updateCache(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('userData');
    if (cachedData != null) {
      List<dynamic> users = jsonDecode(cachedData);
      final index = users.indexWhere((u) => u['id'] == user.id);
      if (index >= 0) {
        users[index] = user.toJson();
      } else {
        users.add(user.toJson());
      }
      await prefs.setString('userData', jsonEncode(users));
    }
  }


  // Handle Dio errors
  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out';
      case DioExceptionType.receiveTimeout:
        return 'Server not responding';
      case DioExceptionType.badResponse:
        return 'Server error: ${error.response?.statusCode}';
      default:
        return 'Network error occurred';
    }
  }
}