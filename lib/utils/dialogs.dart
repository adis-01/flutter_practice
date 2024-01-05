

import 'package:flutter/material.dart';

class MyDialog {
  static Future<void> showError(BuildContext context, String text) async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.5),
              ),
              actionsAlignment: MainAxisAlignment.center,
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.error_rounded,
                      color: Colors.red,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close),
                    )
                  ],
                ),
                const Text(
                  'Error',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Divider(
                  thickness: 1,
                ),
              ]),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.2)),
                    style: ButtonStyle(
                      alignment: Alignment.center,
                    ),
                  ),
                )
              ],
            ));
  }

  static Future<void> showConfirmation(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.5),
              ),
              actionsAlignment: MainAxisAlignment.center,
              icon: Icon(
                Icons.check_circle,
                size: 45,
              ),
              iconColor: Colors.green,
              iconPadding: EdgeInsets.all(20.5),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      message,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 23,
                          color: Colors.blueGrey),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.blueGrey,
                    thickness: 0.3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(20, 35)),
                )
              ],
            ));
  }

  static Future<void> showQuestion(
      BuildContext context, String message, VoidCallback onYes) async {
    return showDialog(

        context: context,
        builder: (builder) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.5),
              ),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              icon: Icon(Icons.question_mark_sharp,
                  color: Colors.blueAccent, size: 45),
              iconPadding: EdgeInsets.all(20.5),
              content: (Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      message,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 23,
                          color: Colors.blueGrey),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.blueGrey,
                    thickness: 0.3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )
              ),
              actions: [
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: const Text('Cancel'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(40, 40))
                ),
                ElevatedButton(onPressed: (){
                  onYes();
                }, child: const Text('Yes'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(40, 40))
                ),
              ],
            ));
  }

  static Future<void> showSuccess(BuildContext context, String message, VoidCallback onYes) {
    return showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.5),
              ),
              actionsAlignment: MainAxisAlignment.center,
              icon: Icon(
                Icons.check_circle,
                size: 45,
              ),
              iconColor: Colors.green,
              iconPadding: EdgeInsets.all(20.5),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      message,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 23,
                          color: Colors.blueGrey),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.blueGrey,
                    thickness: 0.3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    onYes();
                  },
                  child: const Text('OK'),
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(20, 35)),
                )
              ],
            ));
  }
}
