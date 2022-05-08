
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example/home.dart';
import 'package:firebase_example/login_screen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body : StreamBuilder<User?>(
          stream: _isLogin(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            User? user = snapshot.data;
            if(user == null){
              return LoginScreen();
            }
            return Home();
            
          },
        )
      )
    );
  }
}
Stream<User?> _isLogin(){
  return FirebaseAuth.instance.authStateChanges();
}
