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

class LamodaLinkInput extends StatefulWidget {
  @override
  _LamodaLinkInputState createState() => _LamodaLinkInputState();
}

class _LamodaLinkInputState extends State<LamodaLinkInput> {
  TextEditingController tec = TextEditingController();
  bool showIcon = false;

  @override
  void initState() {
    super.initState();
    tec.addListener(() => setState(() => showIcon = tec.text.isNotEmpty));
  }

  @override
  Widget build(BuildContext context) {
    var icon = IconButton(
      icon: Icon(
        Icons.arrow_forward,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () => Navigator.pushNamed(
        context,
        "/add-clothing",
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextFormField(
        controller: tec,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusColor: Theme.of(context).primaryColor,
          suffixIcon: showIcon ? icon : null,
        ),
      ),
    );
  }
}

class LamodaButtonWithInput extends StatefulWidget {
  @override
  _LamodaButtonWithInputState createState() => _LamodaButtonWithInputState();
}

class _LamodaButtonWithInputState extends State<LamodaButtonWithInput> {
  bool showInput = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      FullWidthButton(
        text: "Добавить через Lamoda",
        leading: Image.asset("assets/lamoda.png"),
        onPressed: () => setState(() => showInput = true),
      ),
    ];

    if (showInput) {
      children.add(LamodaLinkInput());
    }

    return Column(children: children);
  }
}
