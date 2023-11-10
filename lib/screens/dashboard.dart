import 'package:expensivetracker/screens/home_screen.dart';
import 'package:expensivetracker/screens/settings_account.dart';
import 'package:expensivetracker/screens/transaction_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:expensivetracker/widgets/navbar.dart';
import 'login_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var isLogoutLoading = false;
  int currentIndex = 0;
  var pageViewList = [ HomeScreen(), TransactionScreen(),SettingsAccount(),];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(selectedIndex: currentIndex, onDestinationSelected: (int value) {
        setState((){
          currentIndex = value;
        });
      },),

      body: pageViewList[currentIndex],
    );
  }
}
