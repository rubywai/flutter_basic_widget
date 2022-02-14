import 'package:example_app/database/database_helper.dart';
import 'package:example_app/model/student.dart';
import 'package:flutter/material.dart';

class UpdateStudent extends StatefulWidget {
   final int id;
   final String name;
   final String address;
   final String phone;
   final String email;

  const UpdateStudent({required this.id,required this.name,required this.address,required this.phone,required this.email});

  @override
  _UpdateStudentState createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  int? id;
  String? name , address, phone, email;
  GlobalKey<FormState> _key = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.id;
    name = widget.name;
    address = widget.address;
    phone = widget.phone;
    email = widget.email;
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Student'),
        centerTitle: true,
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
              initialValue: name,
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
              initialValue: address,
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
              initialValue: email,
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
              initialValue: phone,
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
                  int result = await  DatabaseHelper().updateStudent(Student.insertStudent(
                        name: name ?? '',
                        address: address ?? '',
                        email: email ?? '',
                        phone: phone ?? ''),
                        id!);
                        print(result);
                        Navigator.pop(context,'success');
                  }
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit'))
          ],
        ),
      ),
  
      
    );
  }
}