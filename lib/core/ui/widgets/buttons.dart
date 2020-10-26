import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Widget leading;

  const FullWidthButton({
    Key key,
    @required this.text,
    this.onPressed,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineButton button;
    if (this.leading != null) {
      button = OutlineButton.icon(
        onPressed: () => this.onPressed(),
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
        // todo перенести в theme.dart
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        textColor: Theme.of(context).primaryColor,
        label: Text(text),
        icon: leading,
      );
    } else {
      button = OutlineButton(
        onPressed: () => this.onPressed(),
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        textColor: Theme.of(context).primaryColor,
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
