// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/note_operation.dart';

// ignore: must_be_immutable
class FormAdded extends StatelessWidget {
  FormAdded({Key? key}) : super(key: key);
  final titleText = TextEditingController();
  final descriptionText = TextEditingController();
  bool err = false;
  String errorLine = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Task Manager'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: 80,
        ),
        child: Column(
          children: [
            TextField(
              controller: titleText,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              onChanged: (value) {
                titleText.text = value;
              },
            ),
            Expanded(
              child: TextField(
                controller: descriptionText,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Description',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                onChanged: (value) {
                  descriptionText.text = value;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                if (titleText.text.isEmpty || descriptionText.text.isEmpty) {
                  err = true;
                  if (err == true) {
                    errorLine = "kolom belum terisi";
                    log(errorLine);
                  } else {
                    errorLine = "";
                  }
                } else {
                  Provider.of<NotesOperation>(context, listen: false)
                      .addNewNote(titleText.text, descriptionText.text);
                  Navigator.pop(context);
                }
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 10, bottom: 10),
                backgroundColor: Colors.white,
              ),
              child: const Text('Add Note',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            err
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error,
                        size: 24.0,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        errorLine + "add",
                        style: const TextStyle(
                            fontSize: 15, color: Colors.amberAccent),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
