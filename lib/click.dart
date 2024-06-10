import 'package:flutter/material.dart';

class click extends StatelessWidget {
  final GestureTapCallback? buttontapped;
  final String? tittle;
  final colors;
  final textcolor;
  click({this.buttontapped, this.tittle, this.colors, this.textcolor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
          padding: const EdgeInsets.all(0.2),
        child: ClipRect(
          child: Container(
            color: colors,
            child: Text(
              tittle!,
              style: TextStyle(
                color: textcolor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
