import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButtonAddNote extends StatelessWidget {
  const CustomButtonAddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kPrimaryColor,
      ),
      child: TextButton(
          onPressed: () {},
          child: Text(
            'Add',
            style: TextStyle(fontSize: 20, color: Colors.black),
          )),
    );
  }
}
