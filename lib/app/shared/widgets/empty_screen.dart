import 'package:ejara_test_project/app/shared/app_assets/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyScreen extends StatelessWidget {
  final String? emptyScreenMessage;
  const EmptyScreen({Key? key, this.emptyScreenMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AssetPath.emptyBox, height: 130, width: 130),
                Text(emptyScreenMessage ?? "", style: const TextStyle(color: Color(0xFF52575C), fontSize: 15),),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 70),
                  child: SizedBox(height: 48, width: double.maxFinite,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}