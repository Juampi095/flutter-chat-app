import "package:flutter/material.dart";

class Labels extends StatelessWidget {
  final String route;
  final String title;
  final String subTitle;

  const Labels(
      {super.key,
      required this.route,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          child: Text(subTitle,
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pushReplacementNamed(context, route);
          },
        ),
      ],
    );
  }
}
