import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../helper/exceptions.dart';

class UserRepository {
  UserRepository();

  Future<void> updateProfile(
      {String? name,
      String? pass,
      String? email,
      String? imageURL,
      String? currentPass}) async {
    try {
      final user = await FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw FirebaseAuthFailure("User not found");
      }

      if (name != null && name.isNotEmpty) {
        await user.updateDisplayName(name);
      }

      if (email != null && email.isNotEmpty && email != user.email) {
        await user.verifyBeforeUpdateEmail(email);
        // await user.updateEmail(email);
      }

      if (pass != null && pass.isNotEmpty) {
        await user.reauthenticateWithCredential(EmailAuthProvider.credential(
            email: user.email!, password: currentPass ?? ''));
        await user.updatePassword(pass);
      }

      if (imageURL != null &&
          imageURL.isNotEmpty &&
          imageURL != user.photoURL) {
        String? saved = await saveImage(imageURL, user.photoURL);
        if (saved != null) {
          await user.updatePhotoURL(saved);
        }
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthFailure.fromCode(e.code);
    } catch (ex) {
      throw ex;   
    }
  }

  Future<String?> saveImage(String newImage, String? oldImage) async {
    File file = File(newImage);

    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child(newImage);
      if (oldImage != null) {
        await FirebaseStorage.instance.refFromURL(oldImage).delete();
      }

      await imageRef.putFile(file);
      String image = await imageRef.getDownloadURL();
      return image;
    } on ImageUploadFailure catch (e) {
      throw e;
    }
  }
}
