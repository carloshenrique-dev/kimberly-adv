import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:kimberly/core/repositories/links_repository.dart';

class LinksRepositoryImpl implements LinksRepository {
  @override
  Future<Map<String, dynamic>> getLinks() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('links')
          .doc('myLinks')
          .get();

      return documentSnapshot.data() as Map<String, dynamic>;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return {};
    }
  }
}
