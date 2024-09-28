import 'package:flutter/material.dart';

class CatagoryWidget extends StatelessWidget {
  final String title;
  final Color color;
  const CatagoryWidget({
    super.key, required this.title, required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 30,
      width: 100,

      child: Card(
        margin: EdgeInsets.zero,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: color,
        elevation: 0,
        child: Center(child: Text(title,style: const TextStyle(color: Colors.white),)),
      ),
    );
  }
}