import 'package:example_app/first_screen.dart';
import 'package:example_app/not_fount.dart';
import 'package:example_app/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:url_strategy/url_strategy.dart';


void main(){
  setPathUrlStrategy();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialRoute: '/home',
      routingCallback: (Routing? route){
        print(route?.current);
        
      },
      unknownRoute: GetPage(name: '/notfound',page: () => const NotFoundScreen()),
      getPages: [
        GetPage(name: '/home', page:  () => const FirstScreen()),
        GetPage(
          name: '/second',
           page: () => const SecondScreen(),
           transition: Transition.zoom,
           transitionDuration: Duration(seconds: 3))
      ],

    );
  }
}