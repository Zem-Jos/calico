import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModel {
  String author;
  String title;
  String date;
  String? imageUrl;
  String content;
  String category;
  int readTime;

  ArticleModel({
    required this.author,
    required this.title,
    required this.date,
    this.imageUrl,
    required this.content,
    required this.category,
    required this.readTime,
  });

  factory ArticleModel.fromFirestore(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return ArticleModel(
      author: data['author'],
      title: data['title'],
      date: data['date'],
      imageUrl: data['imageUrl'],
      content: data['content'],
      category: data['category'],
      readTime: int.parse(data['readTime']),
    );
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


