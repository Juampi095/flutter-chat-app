import "package:flutter/material.dart";

class Logo extends StatelessWidget {
  final String title;

  const Logo({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Center(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Image(
              image: AssetImage('assets/tag-logo.png'),
              width: 170,
            ),
          ),
          Text(title, style: const TextStyle(fontSize: 30)),
        ],
      )),
    );
  }
}
