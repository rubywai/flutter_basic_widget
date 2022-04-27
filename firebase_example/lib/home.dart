import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example/add_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
   Home({ Key? key }) : super(key: key);
   final Stream<QuerySnapshot<Map>> _contactDocs = FirebaseFirestore.instance.collection("contacts").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Tutorial')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (_) => const AddScreen()));
        },
      ),
      body: StreamBuilder<QuerySnapshot<Map>>(
        stream: _contactDocs,
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<QueryDocumentSnapshot<Map>>? contactDocsList = snapshot.data?.docs;
            if(contactDocsList != null){
             
              return ListView.builder(
                itemCount: contactDocsList.length,
                itemBuilder: (context,position){
                   QueryDocumentSnapshot<Map> contactDoc = contactDocsList[position];
                  return Card(
                    child: ListTile(
                      title: Text(contactDoc["name"]),
                      trailing: Text(contactDoc["age"]),
                      subtitle: Text(contactDoc["address"]),
                    ),
                  );
                },
              );
            }
            else {
              return const Text('Empty Data');
            }
          }
          else if(snapshot.hasError){
            return const Center(child: Text("Something Wrong"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),  
    );
  }
}