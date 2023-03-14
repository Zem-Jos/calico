import 'package:calico/api/dialogflowcx_api.dart';
import 'package:get/get.dart';

// projects/argon-tractor-379706/locations/us-central1/agents/de8eb146-d4e2-40da-bafd-f599842c6e9b
class TestController extends GetxController {
  DialogflowCxApi dialogflow = DialogflowCxApi(
    location: "us-central1",
    agentId: "de8eb146-d4e2-40da-bafd-f599842c6e9b",
    sessionId: "test-session-123",
  );

  @override
  void onInit() {
    dialogflow.initialize();
    super.onInit();
  }

  void detectIntent() async {
    await dialogflow.detectIntent("hello");
  }
}
