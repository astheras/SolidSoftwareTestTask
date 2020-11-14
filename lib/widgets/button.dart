import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    this.onPressed,
    this.label,
  }) : super(key: key);

  final GestureTapCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Container(
        width: 60,
        height: 60,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).floatingActionButtonTheme.backgroundColor,
              Theme.of(context).floatingActionButtonTheme.foregroundColor
            ],
          ),
        ),
      ),
    );
  }
}
