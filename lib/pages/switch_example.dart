import 'package:bloc_app/Controllers/switch_example/switch_bloc.dart';
import 'package:bloc_app/Controllers/switch_example/switch_state.dart';
import 'package:bloc_app/pages/image_picker_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExampleScreen extends StatelessWidget {
  const SwitchExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example two screen"),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImagePickerScreen(),
                  )),
              icon: const Icon(Icons.navigate_next))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notification"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    return Switch(
                      value: state.isSwitch,
                      onChanged: (value) {
                        context
                            .read<SwitchBloc>()
                            .add(EnableOrDisableNotification());
                        debugPrint(value.toString());
                      },
                    );
                  },
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                return Container(
                  height: 100,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(SliderEvent(slider: value));
                    debugPrint(value.toString());
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
