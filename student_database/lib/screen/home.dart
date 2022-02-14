import 'package:example_app/database/database_helper.dart';
import 'package:example_app/screen/add_student.dart';
import 'package:example_app/screen/update_student.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student DB'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                var result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => AddStudent()));
                if (result == 'success') {
                  setState(() {});
                }
              },
              icon: Icon(Icons.add)),
              IconButton(onPressed: () async{
                await DatabaseHelper()
                 .delete();
                 setState(() {
                   
                 });

              }, icon: Icon(Icons.delete))
        ],
      ),
      body: FutureBuilder<List<Map>>(
        future: DatabaseHelper().getAllStudents(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                Map? student = snapshot.data?[index];
                return Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                            child: Text(student?['id'].toString() ?? '')),
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Name'),
                        subtitle: Text(student?['name']),
                        trailing: IconButton(
                            onPressed: () async {
                              var result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => UpdateStudent(
                                          id: student?['id'],
                                          name: student?['name'],
                                          address: student?['address'],
                                          phone: student?['phone'],
                                          email: student?['email'])));
                              if (result != null && result == 'success') {
                                setState(() {});
                              }
                            },
                            icon: Icon(Icons.edit)),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_city),
                        title: Text('Address'),
                        subtitle: Text(student?['address']),
                        trailing: IconButton(
                          onPressed: () async{
                           await DatabaseHelper()
                            .deleteStudent(student?['id']);
                            setState(() {
                              
                            });

                          },
                          icon: Icon(Icons.delete),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Phone'),
                        subtitle: Text(student?['phone']),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text('Email'),
                        subtitle: Text(student?['email']),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
