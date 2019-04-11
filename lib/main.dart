import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder: /*1*/ (context, i) {
      if (i.isOdd) return Divider(); /*2*/

      final index = i ~/ 2; /*3*/
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10)); /*4*/
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SecondPage(title: pair.asPascalCase)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Demo'),
        backgroundColor: Colors.green,
      ),
      body: _buildSuggestions(),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({@required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            Image.asset(
              'assets/test.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            center,
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.call, color: Colors.blue[500]),
                        Text(
                          'CALL',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.blue[500]),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30.0),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.near_me,
                          color: Colors.blue[500],
                        ),
                        Text(
                          'ROUTE',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.blue[500]),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30.0),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.share, color: Colors.blue[500]),
                        Text(
                          'SHARE',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.blue[500]),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                    'Bernese Alps. Situated 1,578 meters above sea level, it '
                    'is one of the larger Alpine Lakes. A gondola ride from ',
                softWrap: true,
              ),
            ),
          ],
        ));
  }

  final Widget center = Container(
    child: Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(32.0),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Kandersteg, Switzerland',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Icon(Icons.star, color: Colors.red[500]),
            Text('41')
          ],
        )
      ],
    ),
  );
}
