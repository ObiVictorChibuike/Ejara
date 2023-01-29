import 'package:ejara_test_project/app/shared/app_assets/assets_path.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 60,),
        Center(child: Container(
          height: 90,
          width: 90,
          color: Colors.transparent,
          child: const Icon(Icons.error_outline),
        ),),
        const SizedBox(height: 8,),
        Text("To get the best experience \non Dexter App, you need to be \nconnected to the internet.", textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(color: const Color(0xFF52575C), fontSize: 14),)
      ],
    );
  }
}