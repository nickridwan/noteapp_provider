import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_noteapp/provider/note_operation.dart';
import 'package:provider_noteapp/views/screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotesOperation>(
      create: (context) => NotesOperation(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
