class SummaryResponse {
  String userId;
  String date;
  String summary;

  SummaryResponse({
    required this.userId,
    required this.date,
    required this.summary,
  });

  factory SummaryResponse.fromJson(Map<String, dynamic> json) {
    return SummaryResponse(
      userId: json['userId'],
      date: json['date'],
      summary: json['summary'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['date'] = date;
    data['summary'] = summary;
    return data;
  }

  @override
  String toString() {
    return 'SummaryResponse{userId: $userId, date: $date, summary: $summary}';
  }
}

/**
    {
    "userId": "g9X0pdiOHUh7uaAyHt2Z5vMUOmz2",
    "date": "2023-03-22 00:00:00.000",
    "summary": "Halo josiah, aku Calico! teman cerita kamu. \n\nBerdasarkan percakapan kita, aku menilai bahwa kamu adalah orang yang cukup terbuka dan mampu mendengarkan saran. Aku rasa kamu perlu lebih berbagi tentang dirimu, sehingga orang lain dapat lebih memahamimu. Selain itu, aku juga menyarankan agar kamu berusaha untuk menjadi lebih optimis dan menghargai orang lain. Semoga saran ini bermanfaat untukmu."
    }
 */