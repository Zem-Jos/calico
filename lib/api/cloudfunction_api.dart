// import http package
import 'package:calico/utils/date_util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/summary_model.dart';

class CloudFunctionApi {
  static CloudFunctionApi instance = CloudFunctionApi();

  Future<SummaryResponse?> fetchSummary(
      String userId, DateTime dateTime) async {
    if (dateTime.compareTo(DateUtil.getFormattedDate(DateTime.now())) >= 0) {
      print("not allowed");
      return null;
    }

    Map<String, dynamic> body = {
      "userId": userId,
      "date": DateUtil.getFormattedDate(dateTime).toString(),
    };

    final response = await http.post(
        Uri.parse(
            'https://asia-southeast1-argon-tractor-379706.cloudfunctions.net/summary-1'),
        body: json.encode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if (response.statusCode != 200) {
      print(
          'Failed to fetch summary: ${response.statusCode}, ${response.body}');
      return null;
    }

    SummaryResponse summaryResponse =
        SummaryResponse.fromJson(json.decode(response.body));

    return summaryResponse;
  }
}
