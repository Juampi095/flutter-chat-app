import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String text; //Propiedades
  final void Function() onPressed;

  const BlueButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return 5; // Elevation when the button is pressed
              }
              return 2; // Normal state elevation
            },
          ),
          shape: MaterialStateProperty.all(const StadiumBorder()),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
