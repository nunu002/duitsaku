import 'package:expensivetracker/screens/dashboard.dart';
import 'package:expensivetracker/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../services/auth_service.dart';
import '../utils/appvalidator.dart';
import 'package:google_fonts/google_fonts.dart';

//ignore_for_file: prefer_const_constructors
class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var isLoader = false;
  var authService = AuthService();

  Future<void> _submitForm() async{
    if(_formKey.currentState!.validate()){
      setState(() {
        isLoader = true;
      });

      var data = {
        "email": _emailController.text,
        "password": _passwordController.text,

      };

      await authService.login(data, context);

      setState(() {
        isLoader = false;
      });
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
                  // SizedBox(
                  //   height: 50.0,
                  // ),
                  SizedBox(
                      width: 250,
                      child:
                      Text("DUITSAKU",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.acme(
                            textStyle: TextStyle(
                            color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold,letterSpacing:10.0))

                        ,)),
                  SizedBox(
                      width: 250,
                      child:
                      Text("Aplikasi Manajemen Keuangan Anak Kuliah",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white, fontSize: 11,fontWeight: FontWeight.w600)),
                       )),
                  SizedBox(
                    height:16.0,
                  ),
                  SizedBox(
                      width: 250,
                      child:
                      Text("Masuk",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 28,fontWeight: FontWeight.bold),)),
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
                          Text("Login",style: TextStyle(color: Colors.white, fontSize: 20)))),
                  SizedBox(height: 20.0,),
                  SizedBox(
                      width: 250,
                      child:
                      Text("Belum daftar ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),)),
                  TextButton(onPressed: (){ Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpView()),
                  );}, child:
                  Text("Buat Akun Baru Sekarang",style: TextStyle(color: Colors.yellow,fontSize:15)))
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
