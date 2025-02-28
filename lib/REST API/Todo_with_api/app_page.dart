import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
   TextEditingController titleController = TextEditingController();
   TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Title'
            ),
          ),
          TextField(
            controller: descriptionController,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'Description',
            ),
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: submitData, 
            child: Text('Submit')
            ),
        ],
      ),
    );
  }

/// -------------------------POST------------------------
  Future<void> submitData() async{
    //get the data from form
    final title = titleController.text;
    final description = descriptionController.text;

    final body = {
    "title": title,
    "description": description,
    "is_completed": false
    };


    //submit the data to server
    final url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);

    final response = await http.post(uri, body: jsonEncode(body),
    headers: {'Content-Type' : 'application/json'},);

    //show success or fail
    if(response.statusCode == 201){
      showSuccessMessage('Submitted Successfully');

    }else{
      showSuccessMessage('Sorry! Server got error');
    }

  }

  void showSuccessMessage(String message){
    final snackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

  }



}