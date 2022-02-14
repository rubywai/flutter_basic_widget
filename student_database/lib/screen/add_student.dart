import 'package:example_app/database/database_helper.dart';
import 'package:example_app/model/student.dart';
import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  GlobalKey<FormState> _key = GlobalKey();
  String? name, address, email, phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: Form(
        key: _key,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const Text('Name:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (str) {
                if (str == null || str.isEmpty) {
                  return 'Please Enter Name';
                }
                return null;
              },
              onSaved: (str) {
                name = str;
              },
              decoration: const InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Enter Name',
                  border: const OutlineInputBorder()),
            ),
            const Text('Address:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (str) {
                if (str == null || str.isEmpty) {
                  return 'Please Enter Address';
                }
                return null;
              },
              onSaved: (str) {
                address = str;
              },
              decoration: const InputDecoration(
                  prefixIcon: const Icon(Icons.location_city),
                  hintText: 'Enter Address',
                  border: OutlineInputBorder()),
            ),
            const Text('Email:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (str) {
                if (str == null || str.isEmpty) {
                  return 'Please Enter Email';
                }
                return null;
              },
              onSaved: (str) {
                email = str;
              },
              decoration: const InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Enter Email',
                  border: const OutlineInputBorder()),
            ),
            const Text('Phone:'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (str) {
                if (str == null || str.isEmpty) {
                  return 'Please Enter Phone';
                }
                return null;
              },
              onSaved: (str) {
                phone = str;
              },
              decoration: const InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  hintText: 'Enter Phone',
                  border: const OutlineInputBorder()),
            ),
            ElevatedButton.icon(
                onPressed: ()  async{
                  if (_key.currentState != null &&
                      _key.currentState!.validate()) {
                        _key.currentState?.save();
                  int id = await  DatabaseHelper().insertStudent(Student.insertStudent(
                        name: name ?? '',
                        address: address ?? '',
                        email: email ?? '',
                        phone: phone ?? ''));
                        print(id);
                        Navigator.pop(context,'success');
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('Save'))
          ],
        ),
      ),
    );
  }
}
