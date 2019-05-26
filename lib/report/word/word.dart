import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:hk_app/report/word/remindWord.dart';

class WordHome extends StatefulWidget {
  @override
 createState() => new HeaderPartState();
}
class HeaderPartState extends State<WordHome> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  void initState() {
    super.initState();
  }
  void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
       builder:  (context){
         return RemindWord(saveWord:_saved);
       }
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Word'),
        backgroundColor: Colors.cyan,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (BuildContext _context,int i){
        if(i.isOdd) {
          return const Divider();
        }
        final int index = i ~/ 2;
        if (index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }
  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair); // æ–°å¢žæœ¬è¡Œ
    return ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null ,
      ),
      onTap: (){
        setState(() {
          if( alreadySaved){
            _saved.remove(pair);
          } else{
            _saved.add(pair);
          }
        });
      },
    );
  }
}



