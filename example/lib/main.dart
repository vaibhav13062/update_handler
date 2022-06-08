import 'package:flutter/material.dart';
import 'package:update_handler/update_handler.dart';

void main() {
  runApp(const MyApp());
  UpdateHandler.androidAppId = "nic.goi.aarogyasetu";
  UpdateHandler.iosAppId = "1505825357";
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPDATE HANDLER Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  UpdateHandler().isUpdateAvailable(
                      latestBuildNo: 10,
                      lastForceBuildNo: 10,
                      context: context);
                },
                child: Text("Force Updaste Popup")),
            ElevatedButton(
                onPressed: () {
                  UpdateHandler().isUpdateAvailable(
                      latestBuildNo: 10, lastForceBuildNo: 8, context: context);
                },
                child: Text("Soft Updaste Popup"))
          ],
        ),
      ),
    );
  }
}
