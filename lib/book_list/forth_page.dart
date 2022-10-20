import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_watch_app/book_list/domain/book.dart';
import 'forth_page_model.dart';

//firebaseは考えずコード処理をするページ

class ForthPage extends StatelessWidget {
  final List<String> entries = <String>[
    '今日からぼくはブレイクダンス',
    '技術マウントをとるエンジニアさんへの熱いメッセージをぼくは送る',
    'C'
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForthpageModel>(
      create: (_) => ForthpageModel()..fetchBooklist(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 245, 217, 5),
          title: const Text(
            'Forth',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Icon(Icons.laptop_chromebook),
            SizedBox(width: 24),
            Icon(Icons.search),
            SizedBox(width: 24),
            Icon(Icons.menu),
            SizedBox(width: 24),
          ],
        ),
        body: Center(
          child: Consumer<ForthpageModel>(builder: (context, model, child) {
            final List<Book>? books = model.books;

            if (books == null) {
              return CircularProgressIndicator();
            }

            final List<Widget> widgets = books
                .map(
                  (book) => ListTile(
                    title: Text(book.title),
                    subtitle: Text(book.author),
                  ),
                )
                .toList();
            return ListView(
              children: widgets,
            );
          }),
        ),
      ),
    );
  }
}
