import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class UserService {
  final Dio _dio = Dio();
  final String endpoint =
      'https://usersapi-production-4ffe.up.railway.app/users/';

  // Get all users with error handling and caching
  Future<List<UserModel>> getUsers() async {
    List<UserModel> users = [];
    try {
      // Check cache first
      final prefs = await SharedPreferences.getInstance();
      final cachedData = prefs.getString('userData');

      if (cachedData != null) {
        final decoded = jsonDecode(cachedData);
        return _mapData(decoded);
      }

      // If no cache, fetch from API
      final response = await _dio.get(endpoint);
      if (response.statusCode == 200) {
        // Cache the new data
        await prefs.setString('userData', jsonEncode(response.data));
        return _mapData(response.data);
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
      final response = await _dio.post(endpoint, data: user.toMap());
      if (response.statusCode == 201) {
        await _updateCache(user);
        return UserModel.fromJson(response.data);
      }
      throw Exception('Failed to create user');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> updateUser(String id, UserModel updatedUser) async {
    try {
      // Send a PUT request to update the user
      final response = await _dio.put(
        'https://usersapi-production-4ffe.up.railway.app/users/$id',
        data: updatedUser.toMap(),
      );
      // Check if the request was successful
      if (response.statusCode == 200 || response.statusCode == 204) {
        print('User updated successfully: ${response.data}');
      } else {
        print('Failed to update user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('An error occurred: $e');
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      // Send a DELETE request to delete the user
      final response = await _dio.delete(
        'https://usersapi-production-4ffe.up.railway.app/users/$id',
        options: Options(
          headers: {
            'accept': 'application/json',
          },
        ),
      );

      // Check if the request was successful
      if (response.statusCode == 200 || response.statusCode == 204) {
        print('User deleted successfully');
      } else {
        print('Failed to delete user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('An error occurred: $e');
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

  List<UserModel> _mapData(List<dynamic> jsonData) {
    final List<UserModel> users =
        jsonData.map<UserModel>((data) => UserModel.fromMap(data)).toList();
    return users;
  }
}
