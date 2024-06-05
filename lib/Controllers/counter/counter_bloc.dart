import 'package:bloc/bloc.dart';
import 'package:bloc_app/Controllers/counter/counter_event.dart';
import 'package:bloc_app/Controllers/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>((event, emit) {
      emit(state.copyWith(count: state.count + 1));
    });
    on<DecrementCounter>((event, emit) {
      emit(state.copyWith(count: state.count - 1));
    });
  }
}
