import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friendskou/utils/color.dart';
import 'package:image_picker/image_picker.dart';
import '../components/button.dart';
import '../components/text_field.dart';
import '../resources/auth_methods.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_screen.dart';
import '../responsive/web_screen_layout.dart';
import '../utils/utils.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTab;
   const RegisterPage({super.key, required this.onTab});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();
  final bioController = TextEditingController();
  Uint8List? image;
  bool _isLoading = false;
  
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
  }

  void signUpUser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text,
        bio: bioController.text,
        file: image!);
    showDialog(
      context: context,
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      );

    try {
      if(passwordController.text == confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    }else{
      showErrorMessage("Passwords don't match!");
    }
    Navigator.pop(context);
    }on FirebaseAuthException catch (e) {
       Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }
  void showErrorMessage(String message){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.purple,
          title: Center(
            child: Text(
              message,
            style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    
    );
     
    
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      image = im;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 224, 224),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                spaceSmall(),
                //logo
                Stack(
                children: [
                  image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(image!),
                          backgroundColor: Colors.red,
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/200'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
                spaceMedium(),
                //create
                const Text(
                  "Let\'s create an account for you!",
                  style: TextStyle(
                    color: Color.fromARGB(255, 97, 97, 97),
                    fontSize: 16,
                  ),
                ),
                spaceSmall(),
                //username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'E-mail', obscureText: false,
                ),
                spaceSmall(),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username', obscureText: false,
                ),
                spaceSmall(),
                MyTextField(
                  controller: bioController,
                  hintText: 'Bio', obscureText: false,
                ),
                spaceSmall(),
                //password textfield
                 MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                 ),
                 spaceSmall(),
                 MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                 ),
                  spaceSmall(),
                InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: registerbuton(),
                ),
                onTap: signUpUser,
              ),
                spaceMedium(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?',
                    style: TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                    ),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      onTap: widget.onTab,
                      child: const Text('Login now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  ],
                ),
                spaceSmall()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container registerbuton() {
    return Container(
      padding: const EdgeInsets.all(25),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        color: colorGreen3(),
      ),
      child: !_isLoading
          ? const Text(
              'Log in',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )
          :CircularProgressIndicator(
              color: colorWhite(),
            ),
    );
  }

  Color colors() => const Color.fromARGB(255, 189, 189, 189);

  SizedBox spaceLarge() => const SizedBox(height: 50);
  SizedBox spaceSmall() => const SizedBox(height: 10);
  SizedBox spaceMedium() => const SizedBox(height: 25);
}