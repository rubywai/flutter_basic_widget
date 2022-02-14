import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _name = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _address = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance()
     .then((sharedPreference){
       _name.text =  sharedPreference.getString('name') ?? '';
       _age.text =  sharedPreference.getString('age') ?? '';
       _address.text =  sharedPreference.getString('address') ?? '';

     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreference Storage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
             TextField(
              controller: _name,
              decoration: InputDecoration(hintText: 'Enter Name'),
            ),
             TextField(
              controller: _age,
              decoration: InputDecoration(hintText: 'Enter Age'),
            ),
             TextField(
              controller: _address,
              decoration: InputDecoration(hintText: 'Enter Address'),
            ),
            TextButton.icon(
                onPressed: () {
                  save('name', _name.text);
                  save('age', _age.text);
                  save('address', _address.text);
                }, icon: Icon(Icons.save), label: Text('Save'))
          ],
        ),
      ),
    );
  }

  void save(String key, String value) async {
    SharedPreferences _preference = await SharedPreferences.getInstance();
    _preference.setString(key, value);
  }
}
