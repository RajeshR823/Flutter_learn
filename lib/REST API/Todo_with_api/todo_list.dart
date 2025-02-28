import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_second_app/REST API/Todo_with_api/app_page.dart';
import 'package:http/http.dart' as http;

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List items = [];

 @override
  void initState() {
    fetchTodo();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh:fetchTodo ,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index) {
            final item = items[index] as Map;
            final id = item['_id'] as String;
            return ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(item['title']),
              subtitle: Text(item['description']),
              trailing: PopupMenuButton(
                onSelected: (value) {
                  if(value == 'edit'){
                    //put req
                  }else if(value == 'delete'){
                    //remove
                    deletebyid(id);
                  }
                },
                itemBuilder: (context) {
                  return[
                    PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ];
                },

              ),
        
            );
        
          },
        
          ),
      ),
      
      floatingActionButton: FloatingActionButton.extended(onPressed: navigatetoAddPage, label: Text('Add Todo')),




    );
  }
  void navigatetoAddPage(){
    final route = MaterialPageRoute(
      builder: (context) => AppPage(),
    );
    Navigator.push(context, route);
  }

    /// -------------------------GET------------------------
  Future<void> fetchTodo() async {
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
  
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      setState(() {
        items = result;
      });

    }else{
      //show error message

    }
  }

      /// -------------------------Delete------------------------
    Future<void> deletebyid(String id) async{
      //delete the item
      final url = 'https://api.nstack.in/v1/todos/$id';
      final uri = Uri.parse(url);
      final response = await http.delete(uri);
      if(response.statusCode == 200){
             //remove the item
             final filtered = items.where((element) => element['_id'] != id ).toList();
             setState(() {
               items = filtered;
             });
      }
      else{
        //show error
      }

    }








}