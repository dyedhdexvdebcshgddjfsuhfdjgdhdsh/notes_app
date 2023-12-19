import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  NoteItem({Key? key, required this.note}) : super(key: key);
  NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView();
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 16, top: 16, left: 16, right: 8),
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(note.subtitle,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 18)),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(bottom: 23),
                child: IconButton(
                    onPressed: () {
                      note.delete();
                    },
                    icon: Icon(
                      FontAwesomeIcons.trash,
                      size: 25,
                      color: Colors.black,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 35),
              child: Text(note.date,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
