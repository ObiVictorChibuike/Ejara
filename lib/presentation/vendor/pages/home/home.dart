import 'package:ejara_test_project/app/shared/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0, backgroundColor: white,
            leading: Icon(Iconsax.location, color: black,),
            title: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Location", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: dustyGray, fontSize: 12),),
                Row(
                  children: [
                    Text("3329 Joyce St", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: black, fontSize: 14, fontWeight: FontWeight.w600),),
                    Icon(Icons.keyboard_arrow_down_rounded, color: black,)
                  ],
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(),
          ),
        )
    );
  }
}
