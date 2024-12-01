import 'package:flutter/material.dart';
import 'package:holbegram/widgets/text_field.dart';
import 'package:holbegram/screens/login_screen.dart';
import 'package:holbegram/screens/signup_screen.dart';
import 'package:holbegram/screens/upload_image_screen.dart';

class SignUp extends StatefulWidget {
    const SignUp({super.key});

    @override
    State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordConfirmController = TextEditingController();
    bool _passwordVisible = true;

    @override
    void initState() {
        super.initState();
        _passwordVisible = true;
    }

    @override
    void dispose() {
        emailController.dispose();
        passwordController.dispose();
        usernameController.dispose();
        passwordConfirmController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SingleChildScrollView(
                child: Column(
                   mainAxisSize: MainAxisSize.min,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                    // App Logo
                          const SizedBox(height: 28),
                            const Text(
                                'Holbegram',
                                style: TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'Billabong',
                                ),
                            ),
                            Image.asset(
                                'assets/images/logo.webp',
                                height: 60,
                                width: 80,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                    children:[
                                        const SizedBox(height: 28),
                                    const Text(
                                        'Sign up to see photos and videos\nfrom your friends.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                        ),
                                    ),
                            const SizedBox(height: 28),
                    // SignUp Form
                            // Email TextField
                            TextFieldInput(
                                            controller: emailController,
                                            ispassword: false,
                                            hintText: 'Email',
                                            keyboardType: TextInputType.visiblePassword, isPassword: false,
                                        ),
                                        const SizedBox(height: 24),
                            // Username TextField
                            TextFieldInput(
                                            controller: usernameController,
                                            ispassword: false,
                                            hintText: 'Name',
                                            keyboardType: TextInputType.visiblePassword, isPassword: false,
                                        ),
                                        SizedBox(height: 24),
                            // Password TextField
                             TextFieldInput(
                                            controller: passwordController,
                                            ispassword: !_passwordVisible,
                                            hintText: 'Password',
                                            suffixIcon: IconButton(
                                                alignment: Alignment.bottomLeft,
                                                icon: _passwordVisible
                                                    ? const Icon(Icons.visibility_off)
                                                    : const Icon(Icons.visibility),
                                                onPressed: () {
                                                    setState(() {
                                                        _passwordVisible = !_passwordVisible;
                                                    });
                                                },
                                            ),
                                            keyboardType: TextInputType.visiblePassword, isPassword: false,
                                        ),
                                        const SizedBox(height: 24),
                            // Password Confirm TextField
                                TextFieldInput(
                                            controller: passwordConfirmController,
                                            ispassword: !_passwordVisible,
                                            hintText: 'Confirm Password',
                                            suffixIcon: IconButton(
                                                alignment: Alignment.bottomLeft,
                                                icon: _passwordVisible
                                                    ? const Icon(Icons.visibility_off)
                                                    : const Icon(Icons.visibility),
                                                onPressed: () {
                                                    setState(() {
                                                        _passwordVisible = !_passwordVisible;
                                                    });
                                                },
                                            ),
                                            keyboardType: TextInputType.visiblePassword, isPassword: false,
                                        ),
                                        const SizedBox(height: 28),
                    // SignUp Button
                                        SizedBox(
                                            height: 48,
                                            width: double.infinity,
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(218, 226, 37, 24),
                                                    ),
                                                ),
                                            onPressed: () async {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => AddPicture(
                                                            email: emailController.text,
                                                            username: usernameController.text,
                                                            password: passwordController.text,
                                                        ),
                                                    ),
                                                );
                                            },
                                            child: const Text(
                                                'Sign Up',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                ),
                                            ),
                                            ),
                                        ),
                                        const SizedBox(height: 24),
                                    ],
                                ),
                            ),
                            const Divider(
                                thickness: 2,
                            ),
                    // Login Button
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        const Text(
                                            'Have an account?'),
                                        TextButton(
                                            onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => const LoginScreen(),
                                                    ),
                                                );
                                            },
                                            child: const Text(
                                                'Log In',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(218, 226, 37, 24)),
                                                ),
                                            ),
                                    ],
                                        ),
                                        ),
                                    ],
                                ),
                            ),
        );
    }
}