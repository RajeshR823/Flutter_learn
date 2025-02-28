import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://jsonplaceholpder.typicode.com";

  // GET request to fetch posts
  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse("$baseUrl/posts"));

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load posts");
    }
  }

  // POST request to create a post
  Future<Map<String, dynamic>> createPost(String title, String body) async {
    final response = await http.post(
      Uri.parse("$baseUrl/posts"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": title, "body": body, "userId": 1}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to create post");
    }
  }

  // PUT request to update a post
  Future<Map<String, dynamic>> updatePost(int id, String title, String body) async {
    final response = await http.put(
      Uri.parse("$baseUrl/posts/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": title, "body": body, "userId": 1}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to update post");
    }
  }

  // DELETE request to delete a post
  Future<void> deletePost(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/posts/$id"));
  

    if (response.statusCode != 200) {
      throw Exception("Failed to delete post");
    }
  }
}
