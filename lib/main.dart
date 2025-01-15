import 'package:flutter/material.dart';
import 'book_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(BookRecommendationApp());
}

class BookRecommendationApp extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: "کتاب اول",
      author: "نویسنده اول",
      description: "توضیحات کتاب اول",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Book(
      title: "کتاب دوم",
      author: "نویسنده دوم",
      description: "توضیحات کتاب دوم",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Book(
      title: "کتاب سوم",
      author: "نویسنده سوم",
      description: "توضیحات کتاب سوم",
      imageUrl: "https://via.placeholder.com/150",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'پیشنهاد کتاب',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookListScreen(books: books),
    );
  }
}
class BookListScreen extends StatelessWidget {
  final List<Book> books;

  BookListScreen({required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('لیست کتاب‌ها'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(books[index].imageUrl),
            title: Text(books[index].title),
            subtitle: Text(books[index].author),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailScreen(book: books[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
class BookDetailScreen extends StatelessWidget {
  final Book book;

  BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(book.imageUrl),
            SizedBox(height: 16),
            Text(
              book.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              book.author,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              book.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}