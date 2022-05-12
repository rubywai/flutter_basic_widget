part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class Increment extends CounterEvent{}

class Decrement extends CounterEvent{}

class Double extends CounterEvent{}
