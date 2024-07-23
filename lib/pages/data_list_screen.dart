import 'package:bloc_app/Controllers/Data%20list%20bloc/data_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataListScreen extends StatelessWidget {
  const DataListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data List Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // add elements in list when press the button
          showAddItemDialog(context);
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: BlocBuilder<DataListBloc, DataListState>(
        builder: (context, state) {
          return SizedBox(
            child: ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
                  child: ListTile(
                    title: Text(state.items[index]),
                    tileColor: Colors.teal.shade100,
                    trailing: IconButton(
                        onPressed: () {
                          context
                              .read<DataListBloc>()
                              .add(DeleteItemsOnList(index));
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void showAddItemDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Item"),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: "Enter item"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final item = nameController.text;
                if (item.isNotEmpty) {
                  context.read<DataListBloc>().add(AddItemsOnList(item));
                }
                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
