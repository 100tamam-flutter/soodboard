import 'package:flutter/material.dart';

class SignInButtonComponent extends StatelessWidget {
  const SignInButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){},
      style:ElevatedButton.styleFrom(
       backgroundColor: const Color(0xFF40BFFF),
      shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5),),),
        fixedSize: const Size(343, 57)
      ),
      child: Text('Sign In',
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: const Color(0xFFFFFFFF),
          letterSpacing: 0.5,
        ),
      ),
    );

  }
}