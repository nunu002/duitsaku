import 'package:expensivetracker/screens/dashboard.dart';
import 'package:expensivetracker/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/auth_service.dart';
import '../utils/appvalidator.dart';

class SignUpView extends StatefulWidget {
  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  var authService = AuthService();
  var isLoader = false;

  Future<void> _submitForm() async {
    if(_formKey.currentState!.validate()){
      setState(() {
        isLoader = true;
      });

      var data = {
        "username": _userNameController.text,
        "email": _emailController.text,
        "password": _passwordController.text,
        'remainingAmount': 0,
        'totalCredit': 0,
        'totalDebit': 0
      };

  await authService.createUser(data, context);
  // Navigator.pushReplacement(context,
  //     MaterialPageRoute(builder: (context) => Dashboard()));

  setState(() {
    isLoader = false;
  });
        // ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
        //   const SnackBar(content: Text('Form Submitted Successfully'),)
        // );
      }
    }

    var appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color(0xFF219EBC),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key:_formKey,
            child: Column(
          children: [
            Image(image: AssetImage('assets/logo/logo.png'),
                width: 300,
                height: 200),
            SizedBox(height: 15.0,),
            SizedBox(
                width: 250,
                child:
                Text("Buat Akun Baru",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 28,fontWeight: FontWeight.bold),)),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _userNameController,
              keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: _buildInputDecoration("Username", Icons.person),
              validator: appValidator.validateUsername ),
            SizedBox(
              height:16.0,
            ),
            TextFormField(
              controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: _buildInputDecoration("Email", Icons.email),
              validator: appValidator.validateEmail ),
            SizedBox(
              height:16.0,
            ),
            TextFormField(
              controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration("Password", Icons.lock),
                validator: appValidator.validatePassword ),
            SizedBox(
              height:16.0,
            ),
            Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0XFFFFB703)),
                    onPressed: (){isLoader ? print("Loading") :_submitForm();
                    },
                    child: isLoader
                        ? Center(child: CircularProgressIndicator()):

                Text("Buat Akun",style: TextStyle(color: Colors.white, fontSize: 20)))),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
                width: 250,
                child:
                Text("Sudah punya akun ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),)),
            // SizedBox(
            //   height: 10.0,
            // ),
            TextButton(onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginView()),
              );
            }, child:
            Text("Masuk sekarang",style: TextStyle(color: Colors.yellow,fontSize:15)))
          ],
        )),
      ));
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon){
      return InputDecoration(
        fillColor: Color(0XFF023047),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color : Colors.white)),
        filled: true,
        labelStyle: TextStyle(color: Colors.white),
        labelText: label,
        suffixIcon: Icon(suffixIcon, color:Color(0xFFFFB703),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)));
  }
}
