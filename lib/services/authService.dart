import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:instafire/services/storageMethods.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fire = FirebaseFirestore.instance;

  //signup

  Future<String> SignUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List image,
  }) async {
    String res = "Some error occurred";

    try {
      if (email.isNotEmpty ||
              password.isNotEmpty ||
              username.isNotEmpty ||
              bio.isNotEmpty
          // image != null

          ) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        //check image
        String photoUrl =
            await StorageMethods().uploadImg("profileImg", image, false);

        //add user details
        await _fire.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl
        });

        // await _fire.collection('users').add({
        //   'username': username,
        //   'uid': cred.user!.uid,
        //   'email': email,
        //   'bio': bio,
        //   'followers': [],
        //   'following': []
        // });

        res = 'success';
      }
    }
    //  on FirebaseAuthException catch (e) {
    //   switch (e.code) {
    //     case "invalid-email":
    //       res = "Kindly enter an email address";
    //       break;
    //     case "weak-password":
    //       res = "Password should be at least 6 characters";
    //       break;
    //     default:
    //   }
    // }
    catch (e) {
      res = e.toString();
    }
    return res;
  }
}
