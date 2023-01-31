import 'package:ejara_test_project/app/shared/app_assets/assets_path.dart';
import 'package:ejara_test_project/app/shared/app_colors/app_colors.dart';
import 'package:ejara_test_project/app/shared/utils/flush_bar.dart';
import 'package:ejara_test_project/app/shared/utils/form_mixin.dart';
import 'package:ejara_test_project/app/shared/utils/progress_dialog.dart';
import 'package:ejara_test_project/app/shared/widgets/ejara_primary_button.dart';
import 'package:ejara_test_project/app/shared/widgets/dexter_text_field.dart';
import 'package:ejara_test_project/core/state/view_state.dart';
import 'package:ejara_test_project/presentation/auth/login/viewModel/auth_view_model.dart';
import 'package:ejara_test_project/presentation/payment/pages/home/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with FormMixin{
  bool _obscureText = true;
  final userNameController = TextEditingController(text: "ejaraTests");
  final passwordController = TextEditingController(text: "CmKVGexi%REJjn!u65BI7PlR5");
  //Keys
  final formKey = GlobalKey <FormState>();
  final buttonIcons = [
    {
      "assets": AssetPath.google,
      "title": "Google"
    },
    {
      "assets": AssetPath.apple,
      "title": "Apple"
    }
  ];

  @override
  Widget build(BuildContext context) {
    AuthViewModel login = Provider.of<AuthViewModel>(context);
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 84,),
                  Text("Welcome back", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 28, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 8,),
                  Text("Login to your account in few clicks", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w400),),
                  const SizedBox(height: 33,),
                  Text('Email',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 14, color: black),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  EjaraTextField(
                    minLines: null, maxLines: 1, expands: false,
                    hintText: "John Doe",
                    controller: userNameController,
                    validator: isRequired,
                  ),
                  const SizedBox(height: 24,),
                  Text('Password',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 14, color: black),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  EjaraTextField(
                    obscureText: _obscureText,
                    minLines: null, maxLines: 1, expands: false,
                    hintText: "*********",
                    controller: passwordController,
                    validator: validatePassword(
                        shouldContainSpecialChars: true,
                        shouldContainCapitalLetter: true,
                        shouldContainNumber: true,
                        minLength: 8,
                        maxLength: 32,
                        errorMessage:
                        "Password must be up to 8 characters",
                        onNumberNotPresent: () {
                          return "Password must contain number";
                        },
                        onSpecialCharsNotPresent: () {
                          return "Password must contain special characters";
                        },
                        onCapitalLetterNotPresent: () {
                          return "Password must contain capital letters";
                        }),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                          _obscureText ? Iconsax.eye_slash : Iconsax.eye,
                          size: 16,
                          color: const Color(0xff292D32)),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Align(alignment: Alignment.centerRight,
                      child: Text("Forgot Password?", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: greenPea),)),
                  const SizedBox(height: 54,),
                  EjaraPrimaryButton(
                    onTap: () async {
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        ProgressDialogHelper(context).loadingState;
                        await login.login( userName: userNameController.text, password: passwordController.text);
                        if(login.viewState.state == ResponseState.COMPLETE){
                          ProgressDialogHelper(context).loadStateTerminated;
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                          FlushBarHelper(context, "Login Successful").showSuccessBar;
                        }else if(login.viewState.state == ResponseState.ERROR){
                          ProgressDialogHelper(context).loadStateTerminated;
                          FlushBarHelper(context, login.errorMessage).showErrorBar;
                        }
                      }
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                    },
                    buttonBorder: primaryBlue, btnTitle: "Sign In",
                    borderRadius: 15, titleColor: white, btnHeight: 56, btnTitleSize: 16,
                  ),
                  const SizedBox(height: 24,),
                  Align(alignment: Alignment.center,
                      child: Text("Or, login with...", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400, fontSize: 14),)),
                  const SizedBox(height: 32,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(buttonIcons.length, (index){
                          return Column(
                            children: [
                              Container(
                                height: 80, width: 85,
                                decoration: const BoxDecoration(shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(28.0),
                                  child: SizedBox(
                                    height: 30, width: 30,
                                    child: Image.asset(
                                      buttonIcons[index]["assets"]!, fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              Text(buttonIcons[index]["title"]!, style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12, fontWeight: FontWeight.w600, color: dustyGray),)
                            ],
                          );
                        })
                      ],
                    ),
                  ),
                  const SizedBox(height: 38,),
                  const SizedBox(height: 32,),
                  Align(alignment: Alignment.center,
                    child: RichText(text: TextSpan(text: "Don't have an account? ", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: dustyGray), children: [
                      TextSpan(text: "Create one", style:  Theme.of(context).textTheme.bodySmall!.copyWith(color: greenPea),
                          recognizer: TapGestureRecognizer()..onTap = (){

                          })
                    ])),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
