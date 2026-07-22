import 'package:flutter/material.dart';
import '../../widgets/date_picker.dart';

class PersonalProfile extends StatefulWidget {
  const PersonalProfile({super.key});

  @override
  State<PersonalProfile> createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Profile"),
        backgroundColor: Colors.lightGreenAccent.shade400,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: 'Your name',
                      prefixIcon: const Icon(Icons.person),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Vui lòng nhập địa chỉ email';
                      }
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(value.trim())) {
                        return 'Email không đúng định dạng';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.mail),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone number',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Your phone number',
                      prefixIcon: const Icon(Icons.phone),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date of birth',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  DatePicker(),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.check_outlined),
                label: const Text('Save'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent.shade400,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ), // Bo góc 12px (Muốn nút tròn xoe thì tăng lên 30+)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
