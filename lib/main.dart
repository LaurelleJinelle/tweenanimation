import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tween Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: TweenAnimationScreen(),
      debugShowCheckedModeBanner: false,
      );
    }
  }

class TweenAnimationScreen extends StatelessWidget {
  const TweenAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Animation'),
      ),
      body: TweenAnimationBody(),
    );
  }
}

class TweenAnimationBody extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TweenAnimationBodyState createState() => _TweenAnimationBodyState();
}

class _TweenAnimationBodyState extends State<TweenAnimationBody> {
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Slider(
          value: _progress,
          onChanged: (value) {
            setState(() {
              _progress = value;
            });
          },
        ),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: _progress),
          duration: Duration(seconds: 1),
          builder: (context, value, child) {
            return CircularProgressIndicator(value: value);
          },
        ),
      ],
    );
  }
}
