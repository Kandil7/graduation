import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? email;


  String? password;

  String? username;

  bool  isLoading = false ;

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
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Center(
                      child: Center(
                        child: LottieBuilder.asset('images/hellomanger.json',width: 300,height: 300,),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Welcome  !',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 27


                  ),),
                  Text('Create your account',style: TextStyle(
                      color: Colors.black,
                      fontSize: 24


                  ),),
                  SizedBox(height: 70,),

                  SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please Enter Your Email';
                        }
                      },
                      onChanged: (data){
                        email = data ;
                      },

                      decoration: InputDecoration(
                          hintText: '  Enter Your Email',
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
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please Enter Your Password';
                        }
                      },
                      onChanged:  (data){
                        password = data ;
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
                  SizedBox(height: 75,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20),
                    child: ElevatedButton(
                      onPressed: () async {

                        if(formKey.currentState!.validate()){
                          isLoading = true;
                          setState(() {

                          });
                          try{
                            var auth = FirebaseAuth.instance ;
                            UserCredential user = await auth.createUserWithEmailAndPassword(email: email!, password: password!);
                          }on FirebaseAuthException  catch(e){
                            if (e.code == 'weak-password') {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Weak Password')));
                            } else if (e.code == 'email-already-in-use') {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This Email is already exist')));


                            }
                          }
                          isLoading = false ;
                          setState(() {

                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Success')));


                        }else{

                        }



                      },
                      child: Text('Sign Up',style: TextStyle(
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
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text('Already have an account ? ',style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text('Sign In',style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),) ),
                      )
                    ],
                  ),




                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
