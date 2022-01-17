// Flutter
import 'package:flutter/material.dart';

// SpaceJam
import 'package:spacejam/spacejam.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceJam example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'SpaceJam example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Title',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Subtitle',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              'Headline',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Subheading',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Body',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Caption',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
