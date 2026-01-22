import 'package:flutter/material.dart';

class GenderDropdownButton extends StatefulWidget {
  const GenderDropdownButton({super.key});

  @override
  _GenderDropdownButtonState createState() => _GenderDropdownButtonState();
}

class _GenderDropdownButtonState extends State<GenderDropdownButton> {
  String dropdownValue = 'Gender';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButton<String>(
          menuWidth: MediaQuery.of(context).size.width,
          borderRadius: BorderRadius.circular(6),
          value: dropdownValue,
          icon: SizedBox(),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.blueGrey),
          dropdownColor: Colors.white,
          focusColor: Colors.white,
          underline: Container(height: 2, color: Color(0xFFF5F5F5)),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: [
            DropdownMenuItem<String>(value: 'Gender', child: Text('Gender')),
            DropdownMenuItem<String>(value: 'Male', child: Text('Male')),
            DropdownMenuItem<String>(value: 'Female', child: Text('Female')),
          ],
        ),
      ),
    );
  }
}
