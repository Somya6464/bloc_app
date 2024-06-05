import 'package:equatable/equatable.dart';
class CounterState extends Equatable {
  final int count;
  const CounterState({
    this.count = 0,
  });

  CounterState copyWith({int? count}){
    return CounterState(
      count: count ?? this.count
    );
  }
  
  @override
  List<Object?> get props => [count];
}

