class DialogflowResponse {
  final List<ResponseMessage> responseMessages;

  DialogflowResponse({required this.responseMessages});

  factory DialogflowResponse.fromJson(Map<String, dynamic> json) {
    var responseMessagesJson =
        json['queryResult']['responseMessages'] as List<dynamic>;
    var responseMessages = responseMessagesJson
        .map((json) => ResponseMessage.fromJson(json))
        .toList();
    return DialogflowResponse(responseMessages: responseMessages);
  }
}

class ResponseMessage {
  final String text;

  ResponseMessage({required this.text});

  factory ResponseMessage.fromJson(Map<String, dynamic> json) {
    var textJson = json['text'] as Map<String, dynamic>;
    var text = textJson['text'][0] as String;
    return ResponseMessage(text: text);
  }
}
