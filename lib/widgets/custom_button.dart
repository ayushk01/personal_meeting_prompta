import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.isLoading = false,
      this.filled = true,
      this.width = 0})
      : super(key: key);

  final String label;
  final Function() onPressed;
  bool isLoading;
  bool filled;
  double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: filled ? Colors.black : Colors.white,
            primary: filled ? Colors.white : Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: const BorderSide(color: Colors.black))),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width == 0 ? 12.0 : width,
            vertical: 5.0,
          ),
          child: isLoading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: filled ? Colors.white : Colors.black,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(label),
        ),
      ),
    );
  }
}
