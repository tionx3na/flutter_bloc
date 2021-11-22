import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

/* The CounterCubit class is an extension of Cubit and it has two functions, increment()
and decrement() which changes the state in the CounterState class */

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false));

  void increment() => emit(CounterState(counterValue: state.counterValue+1, wasIncremented: true));
  void decrement() => emit(CounterState(counterValue: state.counterValue -1, wasIncremented: false));
}
