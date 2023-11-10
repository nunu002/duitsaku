import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensivetracker/utils/icons_list.dart';
import 'package:expensivetracker/widgets/transaction_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// ignore: must_be_immutable
class TransactionCards extends StatelessWidget {
  TransactionCards({super.key});

  // ignore_for_file: prefer_const_constructors
//ignore_for_file: prefer_const_literals_to_create_immutables



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children:[
          Row(
            children: [
              Text("Transaksi Terkini",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
            ],
          ),
          RecentTransactionsList()
        ],
      ),
    );
  }
}

class RecentTransactionsList extends StatelessWidget {
  RecentTransactionsList({
    super.key,
  });
  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(userId).collection("transactions").orderBy('timestamp',descending: true).limit(20).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Ada yang Salah');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty){
            return const Text("Tidak Ditemukan Transaksi");
          }
          var data = snapshot.data!.docs;

          return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var cardData = data[index];
                return TransactionCard(data: cardData,);
              });
        });
  }
  }



