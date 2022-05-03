import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example/image/image_service.dart';
import 'package:flutter/material.dart';

import 'model/person.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final CollectionReference<Person> _contacts = FirebaseFirestore.instance
      .collection("contacts")
      .withConverter<Person>(
          fromFirestore: (snapsot, _) => Person.fromMap(snapsot.data()!),
          toFirestore: (person, _) => person.toMap());
  bool _loading = false;
  bool _success = false;
  bool _error = false;
  File? _profilePic;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact to Firestore'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _name,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                    hintText: "Enter name",
                    labelText: "Name",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _age,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                    hintText: "Enter Age",
                    labelText: "Age",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _address,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                    hintText: "Enter address",
                    labelText: "Address",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              IconButton(
                  onPressed: () async {
                    File? image = await chooseImage();
                    if (image != null) {
                      setState(() {
                        _profilePic = image;
                      });
                    }
                  },
                  icon: const Icon(Icons.image)),
              (_profilePic != null)
                  ? Image.file(
                      _profilePic!,
                      width: 100,
                      height: 100,
                    )
                  : const SizedBox(),
              ElevatedButton(
                  onPressed: _addContact, child: const Text('Save Contact')),
              (_loading) ? const CircularProgressIndicator() : const SizedBox(),
              (_error) ? const Text("Error") : const SizedBox(),
              (_success) ? const Text('Success') : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addContact() async {
    String? profileUrl;
    setState(() {
      _loading = true;
      _success = false;
      _error = false;
    });
    if(_profilePic != null){
     profileUrl = await uploadImage(_profilePic!);
      
    }
    _contacts
        .add(Person(_name.text, _age.text, _address.text,
            DateTime.now().microsecondsSinceEpoch,profileUrl))
        .then((value) {
      setState(() {
        _loading = false;
        _success = true;
      });
    }).catchError((e) {
      setState(() {
        _loading = false;
        _error = true;
      });
    }).whenComplete(() {
      _name.text = "";
      _age.text = "";
      _address.text = "";
    });
  }
}
