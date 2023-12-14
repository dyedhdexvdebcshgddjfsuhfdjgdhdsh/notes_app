import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16, top: 16, left: 16, right: 8),
      decoration: BoxDecoration(
          color: Color(0xffFFCC80), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              'Flutter Tips',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Text('build your career with thrwat samy',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 18)),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(bottom: 23),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.trash,
                    size: 25,
                    color: Colors.black,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Text('December 13 2023',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
