part of 'data_list_bloc.dart';

class DataListState extends Equatable {
  final List<String> items;
  const DataListState({this.items = const []} );
  
  @override
  List<Object> get props => [items];
}
