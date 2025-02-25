import 'package:flutter/material.dart';
class AdditionInformation extends StatelessWidget {

  final IconData icon;
  final String label;
  final String value;

  const AdditionInformation({
    super.key,
    required this.icon,
    required this.label,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Column(
    
       children: [
            Icon(icon, size: 40,),
            const SizedBox(height: 10),
            Text(label,style: TextStyle(fontSize: 18),),
            const SizedBox(height: 10),
            Text(value,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
          ],
        );
  }
}