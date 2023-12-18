import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButtonAddNote extends StatelessWidget {
  const CustomButtonAddNote(
      {Key? key, required this.onPressed, this.isLoading = false})
      : super(key: key);

  final void Function()? onPressed;
  final bool isLoading;
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kPrimaryColor,
      ),
      child: TextButton(
          onPressed: onPressed,
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
                : Text(
                    'Add',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
          )),
    );
  }
}
