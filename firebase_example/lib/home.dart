import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example/add_screen.dart';
import 'package:firebase_example/model/person.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final Stream<QuerySnapshot<Person>> _contactDocs = FirebaseFirestore.instance
      .collection("contacts")
      .withConverter<Person>(
          fromFirestore: (snapshot, _) => Person.fromMap(snapshot.data()!),
          toFirestore: (person, _) => person.toMap())
         //.orderBy("timestamp",descending: true)
         .where("name",isNotEqualTo: "Aye Aye")
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Tutorial')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const AddScreen()));
        },
      ),
      body: StreamBuilder<QuerySnapshot<Person>>(
        stream: _contactDocs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QueryDocumentSnapshot<Person>>? contactDocsList =
                snapshot.data?.docs;
            if (contactDocsList != null) {
              return ListView.builder(
                itemCount: contactDocsList.length,
                itemBuilder: (context, position) {
                  QueryDocumentSnapshot<Person> contactDoc =
                      contactDocsList[position];
                      print(contactDoc.id);
                  return Card(
                    child: ListTile(
                      title: Text(contactDoc.data().name ?? ''),
                      trailing: Text(contactDoc.data().age ?? ''),
                      subtitle: Text(contactDoc.data().address ?? ''),
                    ),
                  );
                },
              );
            } else {
              return const Text('Empty Data');
            }
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something Wrong"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
