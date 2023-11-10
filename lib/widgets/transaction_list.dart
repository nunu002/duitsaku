import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensivetracker/widgets/transaction_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  TransactionList({super.key, required this.category, required this.type, required this.monthYear});

  final userId = FirebaseAuth.instance.currentUser!.uid;
final String category;
final String type;
final String monthYear;

  @override
  Widget build(BuildContext context) {
    Query query = FirebaseFirestore.instance.collection('users').doc(userId)
        .collection("transactions").orderBy('timestamp', descending: true)
        .where('monthyear', isEqualTo: monthYear)
        .where('type', isEqualTo: type);

    if(category != 'All'){
      query = query.where('category', isEqualTo: category);
    }

    return FutureBuilder<QuerySnapshot>(
        future: query.limit(150).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Ada Sesuatu Yang Salah');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text("Tidak Ditemukan Transaksi");
          }
          var data = snapshot.data!.docs;

          return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var cardData = data[index];
                return TransactionCard(data: cardData,);
              });
        });
  }
}