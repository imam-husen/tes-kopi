import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kopi/widgets/models/coffe_model.dart';

class FirestoreService {
  final CollectionReference coffeeCollection =
      FirebaseFirestore.instance.collection('coffe');

  Stream<List<CoffeeModel>> getCoffees() {
  return coffeeCollection.snapshots().map((snapshot) {
    print("Firestore Data: ${snapshot.docs.length} documents retrieved"); // Tambahkan log
    return snapshot.docs.map((doc) {
      print("Document Data: ${doc.data()}"); // Log setiap dokumen
      return CoffeeModel.fromFirestore(doc.data() as Map<String, dynamic>);
    }).toList();
  });
}
  }

