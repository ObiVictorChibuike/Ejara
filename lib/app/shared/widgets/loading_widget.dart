import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String? loadingMessage;
  const LoadingWidget({Key? key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 300,),
          WillPopScope(
              child: Stack(alignment: AlignmentDirectional.center,
                children: [
                  Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.folder_open_rounded, size: 30,color: Theme.of(context).primaryColor,),
                        const SizedBox(height: 5,),
                        Text(loadingMessage ?? "", style: TextStyle(fontSize:8, color: Theme.of(context).primaryColor,))
                      ],
                    ),
                  ),
                  Center(child: Container(
                    height: 90,
                    width: 90,
                    color: Colors.transparent,
                    child: CircularProgressIndicator(strokeWidth: 0.9,color: Theme.of(context).primaryColor,),
                  ),
                  ),
                ],
              ), onWillPop:()=>Future.value(false)),
        ],
      ),
    );
  }
}
