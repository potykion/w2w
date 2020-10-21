import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;
  final Widget leading;

  const FullWidthButton({
    Key key,
    @required this.text,
    this.onPressed,
    this.color = const Color(0xff2ec4b6),
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineButton button;
    if (this.leading != null) {
      button = OutlineButton.icon(
        onPressed: () => this.onPressed(),
        borderSide: BorderSide(color: color),
        // todo перенести в theme.dart
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        textColor: color,
        label: Text(text),
        icon: leading,
      );
    } else {
      button = OutlineButton(
        onPressed: () => this.onPressed(),
        borderSide: BorderSide(color: color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        textColor: color,
        child: Text(text),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SizedBox(
        height: 44,
        width: double.infinity,
        child: button,
      ),
    );
  }
}
