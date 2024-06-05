import 'package:bloc/bloc.dart';
import 'package:bloc_app/Controllers/switch_example/switch_state.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<SliderEvent>((event, emit) {
      emit(state.copyWith(slider: event.slider.toDouble()));
    });
    on<EnableOrDisableNotification>((event, emit) {
      emit(state.copyWith(isSwitch: !state.isSwitch));
    });
  }
}
