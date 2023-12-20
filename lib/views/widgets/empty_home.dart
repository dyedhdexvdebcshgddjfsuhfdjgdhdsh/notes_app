import 'package:flutter/material.dart';

class EmptyHome extends StatelessWidget {
  const EmptyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
          ),
          Container(
              height: 150,
              width: 150,
              child: Image.asset('assets/images/empty.png'))
          /*      Icon(
            Icons.hourglass_empty_rounded,
            size: 140,
          ),

     */
          ,
          SizedBox(
            height: 30,
          ),
          Text(
            'No Note ! Add Note',
            style: TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}
