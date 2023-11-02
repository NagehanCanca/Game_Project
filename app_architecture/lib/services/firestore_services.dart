
import 'package:app_architecture/constants/consts.dart';

class FirestorServices {

  static getUser(uid) {
    return firestore.collection(userCollection).where('id', isEqualTo: uid).snapshots();
  }
}