import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class QuizQueCreator {
  static Future<Map> genQuizQue(String quizID, int queMoney) async {
    late Map queData = {};
    await FirebaseFirestore.instance
        .collection("quizzes")
        .doc(quizID)
        .collection("questions")
        .where("money", isEqualTo: queMoney)
        .get()
        .then((value) {
      
      queData = value.docs.elementAt(0).data();
    });

    print(queData);
    return queData;
  }
}
