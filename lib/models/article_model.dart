import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ArticleModel {
  String author;
  String title;
  String date;
  // String? imageUrl;
  String? imageName;
  String content;
  String category;

  ArticleModel({
    required this.author,
    required this.title,
    required this.date,
    this.imageName,
    required this.content,
    required this.category,
  });

  factory ArticleModel.fromFirestore(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return ArticleModel(
      author: data['author'],
      title: data['title'],
      date: data['date'],
      imageName: data['imageUrl'],
      content: data['content'],
      category: data['category'],
    );
  }
}

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<ArticleModel>> getArticles() {
    return _db.collection('articles').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => ArticleModel.fromFirestore(doc)).toList());
  }
}

// String _markdownData = '';
// Future<void> _loadMarkdownFile() async {
//   final String markdownData = await rootBundle.loadString('assets/article.md');

//   _markdownData = markdownData;
// }

// // Create a new instance of ArticleModel
// final article = ArticleModel(
//   author: 'April Hatni',
//   title: 'Manajemen Emosi dengan Teknik Reframing',
//   date: '17 November 2020',
//   // urlToImage: 'https://example.com/article/image.png',
//   content: 'gs://calico-80b62.appspot.com/article.md',
// );

// // Get a reference to the Firestore collection where you want to add the document
// final collectionRef = FirebaseFirestore.instance.collection('articles');

// // Use the set() method to add the document to Firestore
// // await collectionRef.doc(article.title).set(article.toJson());


