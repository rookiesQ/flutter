import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
class WordList extends StatefulWidget {
  @override
 createState() => new HeaderPartState();
}
class HeaderPartState extends State<WordList> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
  void someMethod() {
   
  }
  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair); // æ–°å¢žæœ¬è¡Œ
    print(pair);
    return ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null ,
      ),
    );
  }
}



