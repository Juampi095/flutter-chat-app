import 'package:chat_app/widgets/blue_button.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:chat_app/widgets/labels.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Logo(title: 'Register'),
                  const SizedBox(height: 20),
                  _Form(),
                  const Labels(
                    route: 'login',
                    title: 'Ya tienes cuenta?',
                    subTitle: 'Ingresa ahora!',
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Terminos y Condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomInput(
        icon: Icons.perm_identity,
        placeholder: 'Name',
        keyboardType: TextInputType.name,
        textController: nameCtrl,
        isPassword: false,
      ),
      CustomInput(
        icon: Icons.mail_lock_outlined,
        placeholder: 'Email',
        keyboardType: TextInputType.emailAddress,
        textController: emailCtrl,
        isPassword: false,
      ),
      CustomInput(
        icon: Icons.lock_outline,
        placeholder: 'Password',
        textController: passCtrl,
        isPassword: true,
        keyboardType: TextInputType.text,
      ),
      BlueButton(text: 'LogIn', onPressed: () {})
    ]);
  }
}
