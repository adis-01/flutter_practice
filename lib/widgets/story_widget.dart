import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StoryWidget extends StatefulWidget {
  String naslov;
  bool? aktivna;
  int? novcaniCilj;
   StoryWidget({super.key, required this.naslov, this.aktivna, this.novcaniCilj});

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(vertical: 10.5,horizontal:8.5),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(8.5),
        border: Border.all(
          color: Colors.black,
          width: 0.8
        )
      ),
      child: Padding(
        padding: EdgeInsets.all(15.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.naslov,
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 25,
                  letterSpacing: 0.8,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600
                ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   const Icon(Icons.currency_exchange
                    ,color: Colors.green,
                    size:25),
                    const SizedBox(width: 10),
                    Text(widget.novcaniCilj.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1
                    ),
                    ),
                 ],
               ),
                Icon(
                  widget.aktivna! ? Icons.check_circle : Icons.close,
                  size: 25,
                  color: widget.aktivna! ? Colors.green : Colors.red
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}