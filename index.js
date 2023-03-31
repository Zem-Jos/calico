const { Configuration, OpenAIApi } = require("openai");
const { initializeApp } = require("firebase/app");
const { getFirestore, doc, getDoc } = require("firebase/firestore");

const getPreviousMsg = messages => {
  let previousMessages = "";

  messages?.forEach(message => {
    previousMessages += `${message.messageSender}: ${message.messageContent}\n`;
  });

  return { previousMessages, chatExists: messages.length > 0 };
};

exports.function = async (req, res) => {
  const tag = req.body.fulfillmentInfo.tag;
  const msg = req.body.text;
  const sessionRaw = req.body.sessionInfo.session;
  const regex = /sessions\/(.*)/g;
  const sessionId = regex.exec(sessionRaw)[1];

  console.log("session:", sessionId);

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
  const docRef = doc(db, "chatSessions", sessionId);
  const docSnap = await getDoc(docRef);
  const context = docSnap.data().messages;
  const { chatExists, previousMessages: lastChat } = getPreviousMsg(context);

  let message = msg || tag;

  const dialog = chatExists
    ? `Berikut percakapan dengan psikolog virtual dengan manusia. Psikolog virtual memiliki sifat ramah, penuh empati, antusias untuk mendengarkan cerita, serta menggunakan Cognitive behavioural therapy untuk bercakap-cakap dengan user. Psikolog virtual ini akan menjawab pertanyaan maksimal 120 token.\n\nuser: Halo, siapa kamu?\ncalico: Halo, kenalin aku Calico, asisten personal kesehatan mental kamu yang hadir untuk mendengarkan keluh kesahmu. Adakah yang bisa kubantu hari ini?` +
      lastChat
    : `Berikut percakapan dengan psikolog virtual dengan manusia. Psikolog virtual memiliki sifat ramah, penuh empati, antusias untuk mendengarkan cerita, serta menggunakan Cognitive behavioural therapy untuk bercakap-cakap dengan user. Psikolog virtual ini akan menjawab pertanyaan maksimal 120 token.\n\nuser: Halo, siapa kamu?\ncalico: Halo, kenalin aku Calico, asisten personal kesehatan mental kamu yang hadir untuk mendengarkan keluh kesahmu. Adakah yang bisa kubantu hari ini?`;

  const prompt = dialog + `\nuser: ${message}\ncalico:  `;

  const configuration = new Configuration({
    apiKey: process.env.OPENAI_API_KEY,
  });

  const openai = new OpenAIApi(configuration);

  const completionParams = {
    model: "text-davinci-003",
    prompt,
    temperature: 0.72,
    max_tokens: 120,
    top_p: 1,
    frequency_penalty: 0,
    presence_penalty: 0.5,
    stop: [` user:`, " calico:"],
  };

  try {
    const result = await openai.createCompletion(completionParams);

    const botResponse = result.data.choices[0].text.trim();

    const response = {
      fulfillment_response: {
        messages: [
          {
            text: {
              text: [botResponse],
            },
          },
        ],
      },
    };
    res.status(200).send(response);
  } catch (err) {
    console.log(err);
    const response = {
      fulfillment_response: {
        messages: [
          {
            text: {
              text: ["Maaf. Ada yang salah. Bisakah Anda mengatakan itu lagi?"],
            },
          },
        ],
      },
    };
    res.status(200).send(response);
  }
};
