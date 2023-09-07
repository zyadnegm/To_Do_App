import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/user_nodel.dart';

class Firebase_function {
  static CollectionReference<Task_model> getTaskcollection() {
    return FirebaseFirestore.instance.collection("Tasks").withConverter(
      fromFirestore: (snapshot, _) {
        return Task_model.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static CollectionReference<User_model> getUsercollection() {
    return FirebaseFirestore.instance.collection("User").withConverter(
      fromFirestore: (snapshot, _) {
        return User_model.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static Future<void> add_task(Task_model task) {
    var collection = getTaskcollection();
    var document = getTaskcollection().doc();
    task.id = document.id;
    return document.set(task);
  }

  static Stream<QuerySnapshot<Task_model>> get_task(DateTime date) {
    return getTaskcollection()
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("date", isEqualTo: date.millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteData(String id) {
    return getTaskcollection()
        .doc(id)
        .delete()
        .then((value) => "data Deleted")
        .catchError((error) => "Failed to delete user: $error");
  }

  static Future<void> uptadeData(String id, Task_model task_model) {
    return getTaskcollection().doc(id).update(task_model.toJson());
  }

  static Future<void> signup(
      String email, String password, String name, int age) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User_model user_model = User_model(name: name, email: email, age: age);
      var collection = getUsercollection();
      var decref = getUsercollection().doc(credential.user!.uid);
      decref.set(user_model);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<User_model?> readUser(String user_Id) async {
    DocumentSnapshot<User_model> userdoc =
        await getUsercollection().doc(user_Id).get();
    return userdoc.data();
  }
}
