import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/task_model.dart';

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

  static Future<void> add_task(Task_model task) {
    var collection = getTaskcollection();
    var document = getTaskcollection().doc();
    task.id = document.id;
    return document.set(task);
  }

  static Future<QuerySnapshot<Task_model>> get_task() {
    return getTaskcollection().get();
  }
}
