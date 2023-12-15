import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/views/widgets/custom_appbar.dart';
import 'package:notes_app/views/widgets/custom_listviewi_tem.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CustomAppBar(icon: FontAwesomeIcons.search, title: 'Notes'),
          Expanded(child: ListViewItem())
        ],
      ),
    );
  }
}
