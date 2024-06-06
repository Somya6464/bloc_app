import 'package:bloc_app/Controllers/Image%20Picker%20Bloc/image_picker_bloc.dart';
import 'package:bloc_app/Controllers/switch_example/switch_bloc.dart';
import 'package:bloc_app/pages/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Controllers/counter/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => ImagePickerBloc(),
        )
      ],
      child: const MaterialApp(
        title: 'Flutter Bloc',
        home: CounterScreen(),
      ),
    );
  }
}
