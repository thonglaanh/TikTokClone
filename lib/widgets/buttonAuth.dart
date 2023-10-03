import 'package:flutter/material.dart';

class ButtonAuthWidget extends StatelessWidget {
  const ButtonAuthWidget(
      {super.key,
      required this.color,
      required this.label,
      required this.onTap});
  final Color color;
  final String label;

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 18,
      height: 44,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
              color: Colors.black, width: 1, style: BorderStyle.solid)),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
