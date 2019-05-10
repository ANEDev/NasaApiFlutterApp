import 'package:flutter/material.dart';
import 'package:rest_project/data/repository.dart';
import 'package:rest_project/models/nasa_media_object.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NASA REST API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'NASA REST API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  WebServiceRepository repository = WebServiceRepository();

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<NasaMediaObject> myFuture;
  @override
  void initState() {
    super.initState();
    myFuture = widget.repository.getAstronomyPictureOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: myFuture,//widget.repository.getAstronomyPictureOfTheDay(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.done:
              return createListView(context, snapshot);
            default:
              if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          }
        },
      ),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    NasaMediaObject values = snapshot.data;
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Image.network(snapshot.data.url),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "${snapshot.data.title}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("${snapshot.data.explanation}"),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  myFuture = widget.repository.getAstronomyPictureOfSpecificDay("2019-04-08");
                });
              },
              child: Icon(Icons.refresh),
            )
          ],
        );
      },
    );
  }
}
