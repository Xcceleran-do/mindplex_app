import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindplex_app/widgets/dimension.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final Color textClr;
  const ExpandableText({
    Key? key,
    required this.text,
    required this.textClr,
  }) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool isHidden = true;
  double textHeight = Dimenstions.screenHeight / 5.88;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return secondHalf.isEmpty
        ? Text(
            firstHalf,
            style: TextStyle(fontSize: Dimenstions.font15, color: Colors.white),
          )
        : Column(children: [
            Text(isHidden ? firstHalf + "..." : firstHalf + secondHalf,
                style: TextStyle(
                    fontSize: Dimenstions.font15, color: Colors.white)),
            // Row(children: [
            //   Text(
            //     isHidden ? "Show more" : "Show less",
            //     style: TextStyle(
            //         fontSize: Dimenstions.font15,
            //         color: Colors.blueAccent.shade100),
            //   ),
            //   InkWell(
            //     onTap: () {
            //       setState(() {
            //         isHidden = !isHidden;
            //       });
            //     },
            //     child: Icon(
            //       isHidden ? Icons.arrow_drop_down : Icons.arrow_drop_up,
            //       color: Colors.blueAccent.shade100,
            //     ),
            //   )
            // ]),
          ]);
  }
}
