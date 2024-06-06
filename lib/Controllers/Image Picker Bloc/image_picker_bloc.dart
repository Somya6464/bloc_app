import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picker_event.dart';
import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final picker = ImagePicker();
  ImagePickerBloc() : super(const ImagePickerState()) {
    on<GalleryPicker>((event, emit) async {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      emit(state.copyWith(file: file));
    });
  }
}
