import 'package:dwrl_project/features/auth/presentation/componentants/my_button.dart';
import 'package:dwrl_project/features/auth/presentation/componentants/my_textfiled.dart';
import 'package:dwrl_project/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;
  const RegisterPage({super.key, this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // register user button method
  void register() {
    //  prepare info
    final String name = nameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    // add auth method here
    final authCubit = context.read<AuthCubit>();
    // ensuring fields are not empty
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
    //  ensuring passwords match
      if (password == confirmPassword) {
        authCubit.register(email, password, name: name);
      } else {
        // show error pw dont match
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match!!!")
          ),
        );
      }
    } else {
      // show error fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("fields cannot be empty!!!")
          ),
        );
        }
  }

  @override
  void dispose() {
    // Clean up controllers
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
                "Let's get you started !",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 25),

              // name textfield
              MyTextfield(
                controller: nameController,
                hintText: 'Username',
                obscureText: false,
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
              MyTextfield(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // Register button
              MyButton(onTap: register, text: "Sign Up"),
              const SizedBox(height: 25),
              // already a member? login now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to login page
                      widget.togglePages!();
                    },
                    child: Text(
                      "Login now !",
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
