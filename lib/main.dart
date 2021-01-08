import 'package:flutter/material.dart';
import 'package:hn_app/src/article.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  List<Article> _articles = articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: ListView(
          children: _articles
              .map(
                (e) => _buildItem(e),
              )
              .toList(),
        ),
      ),
    );
  }
}

Widget _buildItem(Article e) {
  return Padding(
    padding: EdgeInsets.all(12),
    child: ExpansionTile(
      title: Text(e.text),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("${e.commentsCount} comments"),
            IconButton(
                icon: Icon(Icons.launch),
                onPressed: () {
                  launch("https://${e.domain.toString()}");
                }),
          ],
        ),
      ],
    ),
  );
}
