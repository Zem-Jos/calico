import 'package:calico/models/article_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ArticleController extends GetxController {
  final _db = FirebaseFirestore.instance;

  RxList<ArticleModel> articles = RxList<ArticleModel>([]);
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    _loadArticles();
  }

  void _loadArticles() async {
    try {
      isLoading.value = true;

      var ref = _db.collection("articles");

      QuerySnapshot querySnapshot = await ref.get();

      if (querySnapshot.docs.isEmpty) {
        print('No articles found');
      } else {
        articles.assignAll(querySnapshot.docs
            .map((doc) => ArticleModel.fromFirestore(doc))
            .toList());
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void getArticle() {}
}
