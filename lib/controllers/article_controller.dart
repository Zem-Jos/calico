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

  void _loadArticles() {
    try {
      isLoading.value = true;

      var ref = _db.collection("articles");
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
    isLoading.value = true;
    // _firestoreService.getArticles().listen((articlesData) {
    //   articles.assignAll(articlesData);
    //   isLoading.value = false;
    // });
  }

  void getArticle() {}
}
