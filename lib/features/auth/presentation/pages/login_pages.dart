import 'package:dwrl_project/features/auth/presentation/componentants/my_button.dart';
import 'package:dwrl_project/features/auth/presentation/componentants/my_textfiled.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;
  const LoginPage({super.key, this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // BUILT UI
  @override
  Widget build(BuildContext context) {
    // scaffold
    return Scaffold(

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.lock_open,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ), // Icon
              const SizedBox(height: 25),
              // name of app
              Text(
                "DWLR DATA ANALYTICS APP",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(height: 25),

              // email textfield
              MyTextfield(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // pw textfield
              MyTextfield(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),

              // forgot pw
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ), 
                  ), 
                ],
              ), 
              const SizedBox(height: 25),

              // login button
              MyButton(onTap: () {}, text: "login"),
                const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      ),
                  GestureDetector(
                    onTap: widget.togglePages,
                    child: Text("Register now?",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
