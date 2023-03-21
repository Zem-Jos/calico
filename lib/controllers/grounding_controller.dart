import 'package:get/get.dart';

class GroundingController extends GetxController {
  RxList<String> groundingIcon = RxList<String>([
    'assets/images/icon/grounding_1.png',
    'assets/images/icon/grounding_2.png',
    'assets/images/icon/grounding_3.png',
    'assets/images/icon/grounding_4.png',
    'assets/images/icon/grounding_5.png',
    'assets/images/icon/grounding_done.png',
  ]);

  RxList<String> groundingTitle = RxList<String>([
    'Lihat 5 Hal',
    'Sentuh 4 Hal',
    'Dengarkan 3 Hal',
    'Cium Bau 2 Hal',
    'Rasakan 1 Hal',
    'Selesai!'
  ]);

  RxList<String> groundingDescription = RxList<String>([
    'Lihatlah ke sekelilingmu dan hitunglah lima hal yang dapat Kamu lihat dan ucapkan. Kamu mungkin dapat melihat orang berjalan, burung terbang di langit, atau air hujan. Tarik napas dalam-dalam di antara setiap hal.',
    'Lanjut dengan menyebutkan empat hal yang dapat Kamu sentuh. Mungkin Kamu sedang duduk di kursi dan Kamu bisa merasakan kursi di kaki atau punggungmu. Tarik napas dalam-dalam di antara setiap hal.',
    'Sebutkan tiga hal yang dapat Kamu dengar. Baik di dalam maupun di luar ruangan. Apa pun itu, selama Anda bisa mendengarnya, itu penting. Tarik napas dalam-dalam di antara setiap hal.',
    'Sebutkan dua benda yang dapat kamu cium. Lakukan hal ini dengan mata tertutup. Mungkin Kamu bisa mencium aroma makanan, aroma bunga, atau pengharum ruangan di dekatmu. Tarik napas dalam-dalam di antara setiap hal.',
    'Sebutkan satu hal yang bisa Kamu cicipi. Kamu mungkin bisa merasakan kopi yang Kamu minum pagi ini, atau sarapanmu. Mungkin Kamu bisa merasakan cokelat atau jeruk dari sarapan Anda. Tarik napas dalam-dalam di antara setiap hal.',
    'Semoga setelah ini, Kamu merasa sedikit lebih rileks dan tidak terlalu cemas.',
  ]);

  RxList<double> groundingPercentage =
      RxList<double>([0, 0.2, 0.4, 0.6, 0.8, 1.0]);

  var index = 0.obs;

  void updateIndex() {
    index.value++;
  }

  int getIndex() {
    int currentIndex = index.value;
    return currentIndex;
  }
}
