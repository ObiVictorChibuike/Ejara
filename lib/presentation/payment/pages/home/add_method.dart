import 'package:ejara_test_project/app/shared/app_colors/app_colors.dart';
import 'package:ejara_test_project/app/shared/widgets/dexter_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/shared/widgets/ejara_primary_button.dart';

class AddMethod extends StatefulWidget {
  const AddMethod({Key? key}) : super(key: key);

  @override
  State<AddMethod> createState() => _AddMethodState();
}

class _AddMethodState extends State<AddMethod> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0.0,  backgroundColor: backgroundColor,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 5, top: 5),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                    height: 20, width: 20, decoration: BoxDecoration(color: primaryBlue.withOpacity(0.3), borderRadius: BorderRadius.circular(12)),
                    child: const Center(child: Icon(Icons.clear, color: primaryBlue,))),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 24,),
                Text("New mobile money", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 24, fontWeight: FontWeight.w700, color: primaryBlue),),
                const SizedBox(height: 32,),
                Text('Choose the mobile operator',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 14, color: black),
                ),
                const SizedBox(
                  height: 8,
                ),
                const EjaraTextField(
                  minLines: null, maxLines: 1, expands: false,
                  hintText: "Orange money",
                ),
                const SizedBox(
                  height: 18,
                ),
                Text('Phone number',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 14, color: black),
                ),
                const SizedBox(
                  height: 8,
                ),
                const EjaraTextField(
                  minLines: null, maxLines: 1, expands: false,
                  hintText: "+2349063328398",
                ),
                const SizedBox(
                  height: 18,
                ),
                Text('Full name',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 14, color: black),
                ),
                const SizedBox(
                  height: 8,
                ),
                const EjaraTextField(
                  minLines: null, maxLines: 1, expands: false,
                  hintText: "Joe King",
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    CupertinoSwitch(value: true,
                        activeColor: primaryBlue,
                        onChanged: (value){
                    }),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("Save as payment method", textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: primaryBlue),),
                  ],
                ),
                const SizedBox(height: 235),
                EjaraPrimaryButton(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  buttonBorder: primaryBlue, btnTitle: "Continue",
                  borderRadius: 15, titleColor: white, btnHeight: 56, btnTitleSize: 16,
                ),
              ],
            ),
          ),
        )
    );
  }
}
