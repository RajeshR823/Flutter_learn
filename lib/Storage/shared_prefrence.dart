import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeStorePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeStorePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  bool isEmployed = false;
  String history = "No Data Available";

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Function to save user input in SharedPreferences
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    
    String name = nameController.text;
    int age = int.tryParse(ageController.text) ?? 0;
    List<String> skills = skillsController.text.split(",");
    double height = double.tryParse(heightController.text) ?? 0.0;

    await prefs.setString("name", name);
    await prefs.setInt("age", age);
    await prefs.setStringList("skills", skills);
    await prefs.setDouble("height", height);
    await prefs.setBool("isEmployed", isEmployed);

  }





  // Function to load stored data
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    String? name = prefs.getString("name");
    int? age = prefs.getInt("age");
    List<String>? skills = prefs.getStringList("skills");
    double? height = prefs.getDouble("height");
    bool? isEmployed = prefs.getBool("isEmployed");

    setState(() {
      history = (name != null)
          ? "Name: $name\nAge: $age\nSkills: ${skills?.join(", ")}\nHeight: $height\nEmployed: ${isEmployed == true ? "Yes" : "No"}"
          : "No Data Available";
    });
  }

  // Function to clear all data
  Future<void> _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      history = "No Data Available";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shared Preferences Example")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Enter Name"),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter Age"),
            ),
            TextField(
              controller: skillsController,
              decoration: InputDecoration(labelText: "Enter Skills (comma-separated)"),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter Height (in cm)"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Employed?"),
                Switch(
                  value: isEmployed,
                  onChanged: (value) {
                    setState(() {
                      isEmployed = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveData,
              child: Text("Save Data"),
            ),
            SizedBox(height: 20),
            Text("History:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(history, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clearData,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Delete History"),
            ),
          ],
        ),
      ),
    );
  }
}
