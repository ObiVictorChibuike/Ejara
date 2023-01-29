import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> DexterPopUp({BuildContext? context, String? title, String? body,
    String? btntext, String? btntext1, VoidCallback? apply,VoidCallback? apply1, bool? isDismissible = true}) {
  return   showDialog(
    context: context!,
    barrierDismissible: isDismissible!,
    builder: (BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: CupertinoAlertDialog(
            title: Text(
              title!,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
                fontSize: 17,
                fontFamily: 'PushPenny',
                fontWeight: FontWeight.w700,
              ),
            ),

            content: Text(
              body!,
              textScaleFactor: 1,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).textTheme.bodyText1!.color),
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: apply,
                child: Text(
                  btntext!,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    fontSize: 17,
                    fontFamily: 'PushPenny',
                    fontWeight: FontWeight.w400,
                  ),),),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: apply1,
                child: Text(
                  btntext1!,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    fontSize: 17,
                    fontFamily: 'PushPenny',
                    fontWeight: FontWeight.w400,
                  ),),),
            ]



        )
    ),
  );
}
