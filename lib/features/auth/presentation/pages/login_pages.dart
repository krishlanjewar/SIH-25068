import 'package:dwrl_project/features/auth/presentation/componentants/my_button.dart';
import 'package:dwrl_project/features/auth/presentation/componentants/my_textfiled.dart';
import 'package:dwrl_project/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  
    // auth cubit
   late final authCubit = context.read<AuthCubit>();

  // login button presss
  void login() {
    // prepare email and pw
    final String email = emailController.text;
    final String password = passwordController.text;


    // ensure that the fields are filled
    if (email.isNotEmpty && password.isNotEmpty) {
      // login !
      authCubit.login(email, password);
    }
    // filleds are empty
    else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("fill all the detail")));
    }
  }

  void openForgotPasswordBox() {
    showDialog(context: context,
     builder: (context)=>AlertDialog(
  title: const Text("Forgot Password?"),
  content: MyTextfield(
    controller: emailController,
    hintText: "Enter email..",
    obscureText: false,
  ), // MyTextfield
  actions: [
    // cancel button
    TextButton(
      onPressed: () => Navigator.pop(context),
      child: const Text("Cancel"),
    ), // TextButton
    // reset button
    TextButton(
      onPressed: () async {
        String message =
            await authCubit.forgotPassword(emailController.text);
     if (message== "Password reset email sent ! check inbox") {
          if (context.mounted) {
            Navigator.pop(context);
            emailController.clear();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          }
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          }
        }
      },
      child: const Text("reset"),
    ), // TextButton
  ],
), // AlertDialog
     );
  }

  // BUILT UI
  @override
  Widget build(BuildContext context) {
    // scaffold
    return Scaffold(
      body: SafeArea(
        child: Center(
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
                    GestureDetector(
                      onTap:() => openForgotPasswordBox(),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
        
                // login button
                MyButton(onTap: login, text: "login"),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        "Register now?",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
