importScripts(
  "https://www.gstatic.com/firebasejs/10.7.1/firebase-app-compat.js",
);
importScripts(
  "https://www.gstatic.com/firebasejs/10.7.1/firebase-messaging-compat.js",
);

// Gunakan konfigurasi web dari firebase_options.dart Anda
firebase.initializeApp({
  apiKey: "AIzaSyDb_rY4oPCYQ8iGLslhYsFxbndBWQ-sNhc",
  authDomain: "notes-e45df.firebaseapp.com",
  projectId: "notes-e45df",
  storageBucket: "notes-e45df.firebasestorage.app",
  messagingSenderId: "419219079844",
  appId: "1:419219079844:web:73528bf490a35561b71c31",
});
const messaging = firebase.messaging();

messaging.onBackgroundMessage((payload) => {
  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
    icon: "/favicon.png",
  };
  return self.registration.showNotification(
    notificationTitle,
    notificationOptions,
  );
});
