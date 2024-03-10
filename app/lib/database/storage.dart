import "dart:typed_data";

import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart";
//instance of firebasefirestore

final FirebaseStorage _storage = FirebaseStorage.instance;

//instance of firebase authentication

final FirebaseAuth _auth = FirebaseAuth.instance;
Future<String> uploadingimage(String folderName, Uint8List file) async {
  //
  Reference ref =
      _storage.ref().child(folderName).child(_auth.currentUser!.uid);

  UploadTask upload = ref.putData(file);

  TaskSnapshot snap = await upload;

  String url = await snap.ref.getDownloadURL();

  return await url;
}
