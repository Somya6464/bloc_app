import 'package:bloc_app/Bloc/counter/bloc/counter_bloc.dart';
import 'package:bloc_app/UI/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>CounterBloc (),
      child: const MaterialApp(
      title: 'Flutter Bloc',
      home: CounterScreen(),
    ),
    );
  }
}
