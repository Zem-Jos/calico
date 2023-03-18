import 'dart:convert';
import 'dart:typed_data';

import 'package:calico/models/article_model.dart';
import 'package:calico/views/article_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../views/article_category_screen.dart';

class ArticleController extends GetxController {
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  RxList<ArticleModel?> recommendedArticles = RxList<ArticleModel>([]);
  RxList<ArticleModel?> articlesByCategory = RxList<ArticleModel>([]);
  // RxList<Uint8List?> recommendedArticlesImages = RxList<Uint8List>([]);
  Rx<String> selectedMarkdownFile = "".obs;
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    _loadArticles();
  }

  void _loadArticles() async {
    try {
      isLoading.value = true;
      update();

      List<ArticleModel?> articles = await getArticles();
      recommendedArticles = articles.obs;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<List<ArticleModel?>> getArticles() async {
    var ref = _db.collection("articles");

    QuerySnapshot querySnapshot = await ref.get();

    if (querySnapshot.docs.isEmpty) {
      print('No articles found');
      return [];
    }

    var articles = querySnapshot.docs
        .map((doc) => ArticleModel.fromFirestore(doc))
        .toList();
    return articles;
  }

  void fetchArticlesByCategory(String category) async {
    try {
      isLoading.value = true;
      update();

      final ref =
          _db.collection("articles").where("category", isEqualTo: category);

      QuerySnapshot querySnapshot = await ref.get();

      if (querySnapshot.docs.isEmpty) {
        print('No articles found');
      }

      List<ArticleModel> articles = querySnapshot.docs
          .map((doc) => ArticleModel.fromFirestore(doc))
          .toList();
      articlesByCategory = articles.obs;

      // Get.to(() => ArticleCategoryScreen(
      //       category: category,
      //       key: Key(category),
      //     ));
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }

  void fetchImage(String imageName) async {
    // name.jpg
    final storageRef = _storage.ref().child(imageName);

    try {
      final Uint8List? data = await storageRef.getData();

      print(data);
    } on FirebaseException catch (e) {
      print(
          'Firebase Storage Exception - code: ${e.code}, message: ${e.message}');
      Get.snackbar("Failed to load articles image.", "error: ${e.message}");
    }
  }

  void fetchMarkdownFile(String fileName) async {
    isLoading.value = true;
    update();

    final ref = FirebaseStorage.instance.ref().child(fileName);
    try {
      final Uint8List? data = await ref.getData();
      if (data == null) {
        throw Exception("Failed to load markdown file");
      }

      selectedMarkdownFile.value = utf8.decode(data);
    } catch (e) {
      print(e);
      Get.snackbar("Failed to load markdown file.", "error: ${e.toString()}");
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
