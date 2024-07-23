import 'dart:io';

import 'package:bloc_app/Controllers/Image%20Picker%20Bloc/image_picker_bloc.dart';
import 'package:bloc_app/Controllers/Image%20Picker%20Bloc/image_picker_event.dart';
import 'package:bloc_app/Controllers/Image%20Picker%20Bloc/image_picker_state.dart';
import 'package:bloc_app/pages/data_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
         actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataListScreen(),
                  )),
              icon: const Icon(Icons.navigate_next))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (context, state) {
              return state.file == null
                  ? IconButton(
                      onPressed: () {
                        context.read<ImagePickerBloc>().add(GalleryPicker());
                      },
                      icon: const Icon(Icons.camera_alt))
                  : Image.file(
                      File(state.file!.path.toString()),
                      height: 200,
                      width: 200,
                    );
            },
          ),
        ),
      ),
    );
  }
}
