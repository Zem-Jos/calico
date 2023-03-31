const { Configuration, OpenAIApi } = require("openai");
const {
  getFirestore,
  query,
  where,
  collection,
  getDocs,
} = require("firebase/firestore");
const { initializeApp } = require("firebase/app");

const getPreviousMsg = messages => {
  let previousMessages = "";

  messages?.forEach(message => {
    previousMessages += `${message.messageSender}: ${message.messageContent}\n`;
  });

  return { previousMessages, chatExists: messages.length > 0 };
};

exports.function = async (req, res) => {
  const userId = req.body.userId;
  const date = req.body.date;

  console.log("userId:", userId);
  console.log("date:", date);

  const firebaseConfig = {
      apiKey: process.env.FIREBASE_API_KEY,
      authDomain: process.env.FIREBASE_AUTH_DOMAIN,
      projectId: process.env.FIREBASE_PROJECT_ID,
      storageBucket: process.env.FIREBASE_STORAGE_BUCKET,
      messagingSenderId: process.env.FIREBASE_MSG_ID,
      appId: process.env.FIREBASE_APP_ID,
      measurementId: process.env.FIREBASE_MEASUREMENT_ID,
    };

  const app = initializeApp(firebaseConfig);
  const db = getFirestore(app);
  const collectionRef = collection(db, "chatSessions");

  const q = query(
    collectionRef,
    where("userId", "==", userId),
    where("session", "==", date)
  );

  let data = "";

  try {
    const querySnapshot = await getDocs(q);
    querySnapshot.forEach(doc => {
      data = doc.data();
    });
  } catch (err) {
    console.log(err);
  }

  const { chatExists, previousMessages } = getPreviousMsg(data.messages);

  const prompt = chatExists
    ? previousMessages +
      "\nuser: Berdasarkan percakapan kita tadi, bagaimana kamu menilai diriku dan berikan saran-saran untukku\nCalico:"
    : "Kita belum bercakap-cakap hari ini";

  if (!chatExists) {
    res.status(200).send({
      userId,
      date,
      summary: "Kita belum bercakap-cakap hari ini",
    });
  }

  const configuration = new Configuration({
    apiKey: process.env.OPENAI_API_KEY,
  });

  const openai = new OpenAIApi(configuration);

  const completionParams = {
    model: "text-davinci-003",
    prompt,
    temperature: 0.5,
    max_tokens: 200,
    top_p: 1,
    frequency_penalty: 0,
    presence_penalty: 0.5,
    stop: [` user:`, " calico:"],
  };

  try {
    const result = await openai.createCompletion(completionParams);
    const botResponse = result.data.choices[0].text.trim();

    res.status(200).send({
      userId,
      date,
      summary: botResponse,
    });
  } catch (err) {
    console.log(err);
    res.status(500).send({ error: "Something went wrong" });
  }
};
