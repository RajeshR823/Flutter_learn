import 'package:flutter/material.dart';
import 'package:my_second_app/REST API/Simple JsonPlaceholder/api_service.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final ApiService apiService = ApiService();
  late Future<List<dynamic>> _futurePosts; // Future variable

  @override
  void initState() {
    super.initState();
    _futurePosts = apiService.fetchPosts(); // Initialize the future
  }

  void _createPost() async {
    try {
      var newPost = await apiService.createPost("New Title", "New Body");
      setState(() {
        _futurePosts = apiService.fetchPosts(); // Refresh the future
      });
    } catch (e) {
      print("Error creating post: $e");
    }
  }

  void _deletePost(int id) async {
    try {
      await apiService.deletePost(id);
      setState(() {
        _futurePosts = apiService.fetchPosts(); // Refresh the future
      });
    } catch (e) {
      print("Error deleting post: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter REST API with FutureBuilder')),
      body: FutureBuilder<List<dynamic>>(
        future: _futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Loading
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}")); // Error message
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No posts available.")); // Empty state
          }

          List<dynamic> posts = snapshot.data!;

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(posts[index]['title']),
                subtitle: Text(posts[index]['body']),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deletePost(posts[index]['id']),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createPost,
        child: Icon(Icons.add),
      ),
    );
  }
}
