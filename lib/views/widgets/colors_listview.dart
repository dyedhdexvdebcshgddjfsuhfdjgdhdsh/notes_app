import 'package:flutter/material.dart';
import 'package:notes_app/add_notes_cubit/add_notes_cubit.dart';

List<Color> colors = [
  // Colors.blue,
  Color(0xff19535f),
  Color(0xffd7c9aa),
  Color(0xff7b2d26),
  Color(0xff4f5d75),
  Color(0xff2D3142),
  Color(0xffadfcf9),
  Colors.red,
  Colors.green,
  Color(0xff4b644a),
  Colors.yellowAccent,
  Colors.indigo,
  Colors.deepOrange
];

class ColorItem extends StatelessWidget {
  ColorItem({Key? key, required this.isActive, required this.color})
      : super(key: key);

  final bool isActive;
  final Color color;
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 34,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 30,
            backgroundColor: color,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({Key? key}) : super(key: key);

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  Widget build(BuildContext context) {
    return SizedBox(
      height: (35 * 2),
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    AddNoteCubit.get(context).color = colors[index];
                    setState(() {});
                  },
                  child: ColorItem(
                    isActive: currentIndex == index,
                    color: colors[index],
                  )),
            );
          }),
    );
  }
}
