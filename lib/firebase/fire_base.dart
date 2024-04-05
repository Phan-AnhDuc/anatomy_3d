import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> layDanhSachDau() async {
  CollectionReference modeldata = FirebaseFirestore.instance.collection("dau");
  List<DocumentSnapshot> items = [];
  List<Map<String, dynamic>> dataList = [];

  QuerySnapshot snapshot = await modeldata.get();
  for (var element in snapshot.docs) {
    var mapData = element.data() as Map<String, dynamic>;
    dataList.add(mapData);
  }
  return dataList;
}

Future<List<Map<String, dynamic>>> layDanhSachChiDuoi() async {
  CollectionReference modeldata = FirebaseFirestore.instance.collection("chiduoi");
  List<DocumentSnapshot> items = [];
  List<Map<String, dynamic>> dataList = [];

  QuerySnapshot snapshot = await modeldata.get();
  for (var element in snapshot.docs) {
    var mapData = element.data() as Map<String, dynamic>;
    dataList.add(mapData);
  }
  return dataList;
}

Future<List<Map<String, dynamic>>> layDanhSachChiTren() async {
  CollectionReference modeldata = FirebaseFirestore.instance.collection("chitren");
  List<DocumentSnapshot> items = [];
  List<Map<String, dynamic>> dataList = [];

  QuerySnapshot snapshot = await modeldata.get();
  for (var element in snapshot.docs) {
    var mapData = element.data() as Map<String, dynamic>;
    dataList.add(mapData);
  }
  return dataList;
}

Future<List<Map<String, dynamic>>> layDanhSachThan() async {
  CollectionReference modeldata = FirebaseFirestore.instance.collection("than");
  List<DocumentSnapshot> items = [];
  List<Map<String, dynamic>> dataList = [];

  QuerySnapshot snapshot = await modeldata.get();
  for (var element in snapshot.docs) {
    var mapData = element.data() as Map<String, dynamic>;
    dataList.add(mapData);
  }
  return dataList;
}