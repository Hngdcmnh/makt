import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Material(
            color: Colors.green,
            child: InkWell(
              highlightColor: Colors.red,
              onTap: () {},
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Hello ',
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'bolddddddddddddddddddddddddddddddddddddddddđ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' world!'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
