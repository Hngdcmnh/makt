import 'package:flutter/material.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
              Text('Thay đổi ngôn ngữ'),
            ],
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Row(
                children: [
                  Icon(Icons.flag),
                  Text(''),
                  Visibility(child: Icon(Icons.check_circle),)
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
