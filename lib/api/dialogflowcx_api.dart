import 'dart:convert';
import 'package:googleapis_auth/auth_io.dart';
import 'package:flutter/services.dart' show rootBundle;

class DialogflowCxApi {
  final String location;
  final String agentId;
  final String sessionId;
  late String projectId;
  late final AutoRefreshingAuthClient authenticatedHttpClient;

  DialogflowCxApi({
    required this.location,
    required this.agentId,
    required this.sessionId,
  });

  Future<void> initialize() async {
    final String jsonFileContents =
        await rootBundle.loadString('assets/dialog_flow_auth.json');

    final jsonData = json.decode(jsonFileContents);

    final credentials = ServiceAccountCredentials.fromJson(jsonData);

    List<String> scopes = ["https://www.googleapis.com/auth/dialogflow"];

    final httpClient = await clientViaServiceAccount(credentials, scopes);

    projectId = jsonData["project_id"];
    // _credentials = httpClient.credentials;
    authenticatedHttpClient = httpClient;
  }

  Future<Map<String, dynamic>> detectIntent(String query) async {
    final url =
        'https://$location-dialogflow.googleapis.com/v3/projects/$projectId/locations/$location/agents/$agentId/sessions/$sessionId:detectIntent';
    final body = json.encode({
      'queryInput': {
        'text': {
          'text': query,
          'languageCode': 'en-US',
        },
        'languageCode': 'en-US',
      }
    });

    final response = await authenticatedHttpClient.post(
      Uri.parse(url),
      body: body,
    );

    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to detect intent: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
