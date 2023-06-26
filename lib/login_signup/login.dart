import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduationupdate/login_signup/signup.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../screens/home_screen.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool  isLoading = false ;
  String? email ;
  String? password ;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:isLoading ,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF003566),
                Color(0xFF001d3d),
              ],
            ),
          ),
          child: SingleChildScrollView(// المسافات
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Center(
                      child: LottieBuilder.asset('images/hellomanger.json',width: 300,height: 300,),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Welcome Back !',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 27


                  ),),
                  Text('Login to your account',style: TextStyle(
                      color: Colors.black,
                      fontSize: 24


                  ),),
                  SizedBox(height: 70,),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: TextFormField(
                      onChanged: (data){
                        email = data ;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please Enter Your Email';
                        }
                      },


                      decoration: InputDecoration(
                          hintText: 'Email',
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Image.asset('images/letter.png',width: 40,height: 40,),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)
                          )
                      ),

                    ),
                  ),
                  SizedBox(height: 25,),
                  Padding(

                    padding: const EdgeInsets.only(right: 12.0),
                    child: TextFormField(
                      onChanged: (data){
                        password = data ;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please Enter Your Password';
                        }
                      },

                      decoration: InputDecoration(
                          hintText: '  Password ',
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Image.asset('images/padlock.png',width: 40,height: 40,),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)
                          )
                      ),

                    ),
                  ),
                  SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20),
                    child: ElevatedButton(
                      onPressed: () async{

                        if(formKey.currentState!.validate()){
                          isLoading = true;

                          try{
                            var auth = FirebaseAuth.instance ;
                            UserCredential user = await auth.signInWithEmailAndPassword(email: email!, password: password!);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: ''
                                , )));


                          }on FirebaseAuthException  catch(e){
                            if (e.code == 'email-not-found') {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No email found for that email.')));
                            } else if (e.code == 'wrong-password') {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wrong password .')));


                            }
                          }
                          isLoading = false ;
                          // setState(() {
                          //
                          // });


                        }else{




                        }









                      },
                      child: Text('Login',style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,fontWeight: FontWeight.bold
                      ),),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(300, 50) ,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 70,),
                  SizedBox(height: 20,),


                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
