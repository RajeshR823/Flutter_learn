import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SecureStoragePage extends StatefulWidget {
  @override
  _SecureStoragePageState createState() => _SecureStoragePageState();
}

class _SecureStoragePageState extends State<SecureStoragePage> {
  final storage = FlutterSecureStorage();  // Secure storage instance

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

  // Save data securely
  Future<void> _saveData() async {
    String name = nameController.text;
    String age = ageController.text;
    String skills = skillsController.text; // Store as comma-separated
    String height = heightController.text;
    String employmentStatus = isEmployed ? "true" : "false";

    await storage.write(key: "name", value: name);
    await storage.write(key: "age", value: age);
    await storage.write(key: "skills", value: skills);
    await storage.write(key: "height", value: height);
    await storage.write(key: "isEmployed", value: employmentStatus);

    _loadData();
  }

  // Load data securely
  Future<void> _loadData() async {
    String? name = await storage.read(key: "name");
    String? age = await storage.read(key: "age");
    String? skills = await storage.read(key: "skills");
    String? height = await storage.read(key: "height");
    String? isEmployedString = await storage.read(key: "isEmployed");
    bool isEmployed = isEmployedString == "true";

    setState(() {
      history = (name != null)
          ? "Name: $name\nAge: $age\nSkills: ${skills?.split(",").join(", ")}\nHeight: $height\nEmployed: ${isEmployed ? "Yes" : "No"}"
          : "No Data Available";
    });
  }

  // Clear data securely
  Future<void> _clearData() async {
    await storage.deleteAll();
    setState(() {
      history = "No Data Available";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Secure Storage Example")),
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