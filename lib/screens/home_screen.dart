import 'package:expensivetracker/widgets/add_transactions_form.dart';
import 'package:expensivetracker/widgets/transactions_cards.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/hero_card.dart';
import 'login_screen.dart';

//ignore_for_file: prefer_const_constructors
//ignore_for_file: prefer_const_literals_to_create_immutables

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLogoutLoading = false;

  logOut() async{
    setState((){
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: ((context) => LoginView())));
  }
  final userId = FirebaseAuth.instance.currentUser!.uid;

_dialogBuilder(BuildContext context){
  return showDialog(context: context, builder: (context){
      return AlertDialog(
        content: AddTransactionsForm(),
      );
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF219EBC),
        onPressed: ((){
          _dialogBuilder(context);

      }),
        child: Icon(Icons.add, color: Colors.white,),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF219EBC),
        title: Text("Halo,",
            style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                logOut();
          },
              icon: isLogoutLoading
              ? CircularProgressIndicator():Icon(Icons.logout_rounded, color: Colors.white,))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroCard(userId: userId,
            ),
            TransactionCards(),
          ],
        ),
      ),
    );
  }
}


