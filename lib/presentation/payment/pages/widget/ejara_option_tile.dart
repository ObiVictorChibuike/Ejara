import 'package:ejara_test_project/app/shared/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class EjaraOptionTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  const EjaraOptionTile({Key? key, required this.icon, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                child: Container(
                    height: 40, width: 40, decoration: BoxDecoration(color: primaryBlue.withOpacity(0.3), borderRadius: BorderRadius.circular(30)),
                    child: Center(child: icon)),
              ),
              const SizedBox(width: 15,),
              Column(mainAxisAlignment: MainAxisAlignment.center , crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15, fontWeight: FontWeight.w800, color: primaryBlue),),
                  const SizedBox(height: 5,),
                  Text(subtitle, textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 11, fontWeight: FontWeight.w600, color: dustyGray),),
                ],
              ),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
