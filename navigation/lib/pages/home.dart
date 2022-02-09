import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Image',icon: Icon(Icons.image),),
              Tab(text: 'Video',icon: Icon(Icons.video_collection),)
            ],
          ),
      ),
      body: TabBarView(children: [
          Center(child: Text('Image'),),
          Center(child: Text('Video'),),
      ],),
      ));
  }
}