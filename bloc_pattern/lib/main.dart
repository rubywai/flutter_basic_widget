import 'package:bloc_pattern/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Pattern Counter Example')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child:
                BlocBuilder<CounterBloc, int>(
                  builder: ((context, state) {
              return Text(
                state.toString(),
                style: const TextStyle(fontSize: 30),
              );
            }))),
          ),
          ElevatedButton(onPressed: () {
            counterBloc.add(Increment());
          }, child: const Text('Increment')),
          ElevatedButton(onPressed: () {
            counterBloc.add(Decrement());
          }, child: const Text('Decrement')),
          ElevatedButton(onPressed: () {
            counterBloc.add(Double());
          }, child: const Text('Double')),
          BlocListener<CounterBloc,int>(
            listener: (context,state){
              print("state is $state");
            },
            child: const Text('Listener'),
            ),
            
          
        ],
      ),
    );
  }
}
