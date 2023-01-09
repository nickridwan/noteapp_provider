import 'package:flutter/material.dart';
import '../../models/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  const NoteCard({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        textDirection: TextDirection.ltr,
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            note.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            note.desc,
            style: const TextStyle(fontSize: 15),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
