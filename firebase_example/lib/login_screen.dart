import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _codeSend = false;
  bool _loding = false;
  String? _verificationId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (_codeSend) ?
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             TextField(
              keyboardType: TextInputType.phone,
              controller: _otpController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter otp',
                  labelText: 'Enter otp',
                  ),
            ),
            ElevatedButton(
                onPressed: () async{
                  if(_otpController.text.length > 4){
                    setState(() {
                      _loding = true;
                    });
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: _verificationId!, smsCode: _otpController.text);
                   FirebaseAuth.instance.signInWithCredential(credential)
                   .then((value) {

                   }).catchError((e){});
                 
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter OTP')));
                  }
                  
                },
                child: const Text('Verify OTP')),
                 (_loding) ? const CircularProgressIndicator() : const SizedBox()
           ],
         ):
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.phone,
              controller: _phoneController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Phone Number',
                  labelText: 'Phone Number',
                  prefix: Text('09')),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_phoneController.text.length > 5) {
                    setState(() {
                       _loding = true;
                    });
                     
                    FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '+959${_phoneController.text}', 
                      verificationCompleted: (credential){
                         
                      },
                       verificationFailed: (exception){
                          print('failed');
                       }, 
                       codeSent: (s,n){
                         _verificationId = s;
                         setState(() {
                           _codeSend = true;
                           _loding = false;
                         
                         });
                       }, 
                       codeAutoRetrievalTimeout: (str){
                         print('time out');
                       }
                       );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please Enter Phone Number')));
                  }
                },
                child: const Text('Get OTP')),

                (_loding) ? const CircularProgressIndicator() : const SizedBox()

                
          ],
        ),
      ),
    );
  }
}
