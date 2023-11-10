import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensivetracker/widgets/category_dropdown.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../utils/appvalidator.dart';


class AddTransactionsForm extends StatefulWidget {
  const AddTransactionsForm({super.key});

  @override
  State<AddTransactionsForm> createState() => _AddTransactionsFormState();
}

class _AddTransactionsFormState extends State<AddTransactionsForm> {
  var type = "credit";
  var category = "Others";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var isLoader = false;
  var appValidator = AppValidator();
  var amountEditController = TextEditingController();
  var titleEditController = TextEditingController();
  var uid = Uuid();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });
      final user = FirebaseAuth.instance.currentUser;
      int timestamp = DateTime.now().millisecondsSinceEpoch;
      var amount = int.parse(amountEditController.text);
      DateTime date = DateTime.now();

      var id = uid.v4();
      String monthyear = DateFormat('MMM y').format(date);
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();

      int remainingAmount = userDoc['remainingAmount'];
      int totalCredit = userDoc['totalCredit'];
      int totalDebit = userDoc['totalDebit'];

      if(type == 'credit'){
        remainingAmount += amount;
        totalCredit += amount;
      } else {
        remainingAmount -= amount;
        totalDebit += amount;
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
        "remainingAmount" : remainingAmount,
        "totalCredit" : totalCredit,
        "totalDebit" : totalDebit,
        "updateAt" : timestamp,
      });

      var data ={
        "id" : id,
        "title": titleEditController.text,
        "amount": amount,
        "type": type,
        "timestamp": timestamp,
        "totalCredit": totalCredit,
        "totalDebit": totalDebit,
        "remainingAmount": remainingAmount,
        "monthyear": monthyear,
        "category": category,
      };
      await FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection("transactions")
      .doc(id)
      .set(data);

      Navigator.pop(context);

      setState(() {
        isLoader = false;
      });
    }
  }

    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: titleEditController,
                validator: appValidator.isEmptyCheck,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    labelText: 'Judul'
                ),
              ),
              TextFormField(
                controller: amountEditController,
                validator: appValidator.isEmptyCheck,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Jumlah Uang ( tanpa titik )'
                ),
              ),
              CategoryDropDown(
                cattype: category,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      category = value;
                    });
                  }
                },
              ),
              DropdownButtonFormField(
                  value: 'credit',
                  items: [
                    DropdownMenuItem(child: Text("Credit"), value: 'credit',),
                    DropdownMenuItem(child: Text("Debit"), value: 'debit',),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        type = value;
                      });
                    }
                  }),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (isLoader == false) {
                      _submitForm();
                    }
                  },
                  child: isLoader
                      ? Center(child: CircularProgressIndicator())
                      : Text("Tambahkan Transaksi"))
            ],
          ),
        ),
      );
    }
  }
