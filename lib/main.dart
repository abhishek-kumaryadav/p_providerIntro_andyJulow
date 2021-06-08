import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:provider_andy_1/models/info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Info(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PageOne(),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(child: Top()),
          Flexible(child: Bottom()),
        ],
      ),
    );
  }
}

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var info = Provider.of<Info>(context);
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  info.changeTitle('NewTITLE');
                  info.changeDesc("NEWDESC");
                },
                child: Text('Change Value')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => PageTwo()));
                },
                child: Text('NextPage')),
          ],
        ),
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = Provider.of<Info>(context);
    return Container(
      child: Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 20),
            children: [
              TextSpan(
                text: item.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ": "),
              TextSpan(text: item.desc),
            ],
          ),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = Provider.of<Info>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 20),
              children: [
                TextSpan(
                  text: item.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ": "),
                TextSpan(
                  text: item.desc,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
