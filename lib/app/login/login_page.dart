import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccout = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(isCreatingAccout == true ? 'Registation' : 'Logging'),
              const SizedBox(height: 20),
              TextField(
                controller: widget.emailController,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
              ),
              TextField(
                controller: widget.passwordController,
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Text(errorMessage),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (isCreatingAccout == true) {
                    // registration
                    try {
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  } else {
                    // logging
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  }
                },
                child: Text(isCreatingAccout == true ? 'Register' : 'Log in'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  setState(() {
                    isCreatingAccout = !isCreatingAccout;
                  });
                },
                child: Text(isCreatingAccout == true ? 'Log in' : 'Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
