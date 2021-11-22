part of 'counter_cubit.dart';

/* The CounterState class has the counterValue which is the state that changes */

class CounterState {
  int counterValue;
  bool wasIncremented;
  CounterState({
    required this.counterValue,
    required this.wasIncremented,
  });
}
