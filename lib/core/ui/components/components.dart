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

    return FixedPadding(
      child: SizedBox(
        height: 44,
        width: double.infinity,
        child: button,
      ),
    );
  }
}

class WithHeadlineText extends StatelessWidget {
  final String text;
  final Widget child;
  final Widget trailing;
  final bool withPadding;

  const WithHeadlineText(
      {Key key, this.text, this.child, this.trailing, this.withPadding = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget textRow = Row(
      children: [
        Text(text, style: Theme.of(context).textTheme.headline6),
        Spacer(),
        if (trailing != null) trailing
      ],
    );

    textRow = withPadding ? FixedPadding(child: textRow) : textRow;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [textRow, child],
    );
  }
}

class TextInput extends StatefulWidget {
  final String initial;
  final Function(String title) change;

  const TextInput({Key key, this.initial, this.change}) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  var tec = TextEditingController();

  @override
  void initState() {
    super.initState();
    tec.text = widget.initial;
    tec.addListener(() => widget.change(tec.text));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: tec,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}

class FixedPadding extends StatelessWidget {
  final Widget child;

  const FixedPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: child);
}

class LinkSubmitInput<SubmissionResult> extends StatefulWidget {
  final Future<SubmissionResult> Function(String link) onSubmit;
  final Function(SubmissionResult submitResult) postSubmit;
  final String helperText;
  final String hintText;

  const LinkSubmitInput({
    Key key,
    this.onSubmit,
    this.postSubmit,
    this.helperText,
    this.hintText,
  }) : super(key: key);

  @override
  _LinkSubmitInputState createState() => _LinkSubmitInputState();
}

class _LinkSubmitInputState extends State<LinkSubmitInput> {
  TextEditingController tec = TextEditingController();

  String link;

  bool showSubmitIcon = false;
  bool showProgress = false;

  @override
  void initState() {
    super.initState();
    tec.addListener(
      () => setState(() {
        if (link != tec.text) {
          link = tec.text;
          showSubmitIcon = tec.text.isNotEmpty;
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    var submitIcon = IconButton(
      icon: Icon(Icons.arrow_forward),
      onPressed: () async {
        FocusScope.of(context).unfocus();

        setState(() {
          showSubmitIcon = false;
          showProgress = true;
        });

        var res = await widget.onSubmit(link);

        setState(() {
          showSubmitIcon = true;
          showProgress = false;
        });

        widget.postSubmit(res);
      },
    );

    var progress = Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularProgressIndicator(),
    );

    return FixedPadding(
      child: TextFormField(
        controller: tec,
        readOnly: showProgress,
        decoration: InputDecoration(
          helperText: widget.helperText,
          hintText: widget.hintText,
          border: OutlineInputBorder(),
          focusColor: Theme.of(context).primaryColor,
          suffixIcon: showSubmitIcon
              ? submitIcon
              : showProgress
                  ? progress
                  : null,
        ),
      ),
    );
  }
}
