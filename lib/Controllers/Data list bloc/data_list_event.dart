part of 'data_list_bloc.dart';

abstract class DataListEvent extends Equatable {
  const DataListEvent();

  @override
  List<Object> get props => [];
}


class AddItemsOnList extends DataListEvent{
   final String item;

  const AddItemsOnList(this.item);

  @override
  List<Object> get props => [item];
}

class DeleteItemsOnList extends DataListEvent{
   final int index;

  const DeleteItemsOnList(this.index);

  @override
  List<Object> get props => [index];
}