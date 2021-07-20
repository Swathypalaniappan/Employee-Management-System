class Entry {
  final String name;
  final String email;
  final String id;
  final String no;

  Entry({
    this.name,
    this.email,
    this.id,
    this.no,
  });

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'ID': id,
      'Email': email,
      'Contact Number': no,
    };
  }

  factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
      name: map['Name'],
      id: map['ID'],
      email: map['Email'],
      no: map['Contact Number'],
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';

// class Database {
//   CollectionReference employee =
//       FirebaseFirestore.instance.collection('employee');

//   Future<void> addRecord(
//       String name, String id, String email, String no) async {
//     employee
//         .doc(id)
//         .set({'Name': name, 'ID': id, 'Email': email, 'Contact Number': no});
//     return;
//   }
// }
