import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_list_event.dart';
part 'data_list_state.dart';

class DataListBloc extends Bloc<DataListEvent, DataListState> {
  DataListBloc() : super(const DataListState()) {
    on<AddItemsOnList>((event, emit) {
      final updatedList = List<String>.from(state.items)..add(event.item);
      emit(DataListState(items: updatedList));
    });

    on<DeleteItemsOnList>((event, emit) {
      final updatedList = List<String>.from(state.items)..removeAt(event.index);
      emit(DataListState(items: updatedList));
    });
  }
}
