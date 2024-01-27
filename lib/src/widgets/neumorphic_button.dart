import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NeumorphismButtonDemo extends StatefulWidget {
  Widget? child;
  Color? color;
  
  NeumorphismButtonDemo({Key? key, this.child, this.color}) : super(key: key);
  @override
  State<NeumorphismButtonDemo> createState() => _NeumorphismButtonDemoState();
}

class _NeumorphismButtonDemoState extends State<NeumorphismButtonDemo> {
  bool isElevated = true;

  @override
  Widget build(BuildContext context) {
    Offset distance =
        isElevated ? const Offset(6.25, 6.25) : const Offset(12.5, 12.5);
    double blur = isElevated ? 10.0 : 30.0;
    return Center(
      child: GestureDetector(
          onTap: () {
            setState(() {
              isElevated = !isElevated;
            });
          },
          child: Container(
            //color: Color(0xffecf0f3),
            child: Container(
              width: 100,
              height: 100,
              child: widget.child,
              decoration: BoxDecoration(
                color: Color(0xffecf0f3),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffbbbfc2),
                    Color(0xffffffff),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffffffff),
                    offset: distance,
                    blurRadius: blur,
                    inset: isElevated,
                  ),
                  BoxShadow(
                    color: Color(0xffbbbfc2),
                    offset: distance,
                    blurRadius: blur,
                    inset: isElevated,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
