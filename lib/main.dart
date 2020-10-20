import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
              headline4: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xff12130f),
              ),
              button: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          canvasColor: Colors.white),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "В гардеробе пустовато\nДобавь что-нибудь",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            FullWidthButton(
              text: "Добавить",
            )
          ],
        ),
      ),
    );
  }
}

class FullWidthButton extends StatelessWidget {
  final String text;
  final Color color = const Color(0xff2ec4b6);

  const FullWidthButton({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: SizedBox(
          height: 44,
          width: double.infinity,
          child: OutlineButton(
            onPressed: () {},
            child: Text(text),
            borderSide: BorderSide(color: color),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            textColor: color,
          ),
        ));
  }
}
