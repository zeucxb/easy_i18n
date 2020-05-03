import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_i18n/easy_i18n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  EasyI18nDelegate easyI18nDelegate;

  @override
  void initState() {
    easyI18nDelegate = EasyI18nDelegate(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('pt'),
        Locale('es'),
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: easyI18nDelegate.localizationsDelegates,
      supportedLocales: easyI18nDelegate.supportedLocales,
      localeResolutionCallback: easyI18nDelegate.localeResolutionCallback,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
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
      appBar: AppBar(
        title: Text(
          EasyI18n.of(context).populate(
            EasyI18n.of(context).trans('title'),
            {'appName': 'i18n'},
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              EasyI18n.of(context).trans('message'),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: EasyI18n.of(context).trans('increment'),
        child: Icon(Icons.add),
      ),
    );
  }
}
