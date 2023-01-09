import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/note_operation.dart';
import '../widgets/note_card.dart';
import 'form_add.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 24.0,
          color: Colors.blue,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormAdded(),
            ),
          );
        },
        backgroundColor: Colors.white,
      ),
      appBar: AppBar(
        title: const Text(
          'Task Manager',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<NotesOperation>(
        builder: (context, NotesOperation data, child) {
          return ListView.builder(
            itemCount: data.getNotes.length,
            itemBuilder: (context, index) {
              return NoteCard(
                note: data.getNotes[index],
              );
            },
          );
        },
      ),
    );
  }
}
