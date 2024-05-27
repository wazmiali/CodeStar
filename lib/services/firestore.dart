import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


// below function is used to upload screenshot taken while giving feedback by the use of feedback package
uploadImage(Uint8List screenshot) async {
  final user = FirebaseAuth.instance.currentUser;
  try {
    // Define the path where you want to save the screenshot
    String filePath =
        'screenshots/screenshot_${DateTime.now().millisecondsSinceEpoch}_${user?.email}.png';

    // Create a reference to the location in Firebase Storage
    Reference ref = FirebaseStorage.instance.ref().child(filePath);

    // Upload the Uint8List data to firebase storage
    UploadTask uploadTask = ref.putData(screenshot);
    await uploadTask.whenComplete(() => print('Upload complete'));

    // Get the download URL of the uploaded file
    String downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  } on FirebaseException catch (e) {
    print('Error uploading image: $e');
  }
}

// below function is used to record user feedback in firebase cloud database and feedback package is used
Future<void> addFeedback(String text, screenshotUrl) async {
  final user = FirebaseAuth.instance.currentUser;

  // create new instance of firestore
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    // Create a reference to the feedback document
    // and update the firestore collection named feedback
    await firestore
        .collection('feedback')
        .doc('${user?.email}_${DateTime.now().millisecondsSinceEpoch}')
        .set(
      {
        'imageUrl': screenshotUrl,
        'userId': user?.uid,
        'email': user?.email,
        'message': text,
        'Timestamp': DateTime.now()
      },
    );
  } catch (error) {
    print('Error recording feedback: $error');
  }
}
