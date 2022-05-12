import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Increment>((event,emit) => emit(state + 1));
    on<Decrement>(((event, emit) => emit(state -1)));
    on<Double>(((event, emit) => emit(state * 2)));
  }
}
