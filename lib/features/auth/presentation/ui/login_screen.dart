import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaty_app/core/routes/routes.dart';
import 'package:taskaty_app/features/auth/presentation/cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email Field
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Password Field (تمت إضافته هنا)
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // BlocListener & Login Button
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is Authsuccess) {
                  Navigator.pop(context); 
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.homeScreen,
                    (v) => false,
                  );
                } else if (state is AuthError) {
                  Navigator.pop(context); 
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                },
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}