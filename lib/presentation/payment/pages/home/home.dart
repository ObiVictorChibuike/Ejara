import 'package:ejara_test_project/app/shared/app_colors/app_colors.dart';
import 'package:ejara_test_project/app/shared/widgets/ejara_primary_button.dart';
import 'package:ejara_test_project/presentation/payment/pages/widget/dexter_bottom_sheet.dart';
import 'package:ejara_test_project/presentation/payment/pages/widget/ejara_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final paymentOption = [
    {
      "title": "Cash Payment",
      "subtitle": "Fees: Offer",
    },
    {
      "title": "Mobile money",
      "subtitle": "Fees: 200CFA",
    },
    {
      "title": "Bank transfer",
      "subtitle": "Fees: Variable",
    },
    {
      "title": "Credit card",
      "subtitle": "Fees: Variable",
    },
    {
      "title": "Crypto-currency",
      "subtitle": "Fees:",
    },
  ];

  final moneyMethod = [
    {
      "title": "Orange money",
      "subtitle": "696 7676 89",
    },
    {
      "title": "MTN Mobile money",
      "subtitle": "696 7676 89",
    },
    {
      "title": "Orange money",
      "subtitle": "696 7676 89",
    },
  ];

  void showPaymentOptionBottomSheet(BuildContext context){
    MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/1.6,
        children:[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Text("select the mobile money method", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15, fontWeight: FontWeight.w700, color: primaryBlue),),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                  child: const Icon(Icons.clear, color: primaryBlue,)),
            ],
          ),
          const Divider(),
          ...List.generate(moneyMethod.length, (index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Container(
                  height: 60, width: double.maxFinite,
                  decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(moneyMethod[index]["title"]!,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12, fontWeight: FontWeight.w700, color: primaryBlue), ),
                          Text(moneyMethod[index]["title"]!,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 9, fontWeight: FontWeight.w700, color: primaryBlue), )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          EjaraPrimaryButton(
            btnWidth: double.maxFinite, btnHeight: 50,
            btnColor: primaryBlue.withOpacity(0.4),
            btnTitle: "+ Another mobile money method",
            buttonBorder: primaryBlue.withOpacity(0.4),
          )
          ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0.0,  backgroundColor: backgroundColor,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 5, top: 5),
              child: Container(
                height: 20, width: 20, decoration: BoxDecoration(color: primaryBlue.withOpacity(0.3), borderRadius: BorderRadius.circular(12)),
                  child: const Center(child: Icon(Icons.arrow_back_ios_new, color: primaryBlue,))),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 24,),
                Text("Choose a payment \nmethod", textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 24, fontWeight: FontWeight.w700, color: primaryBlue),),
                const SizedBox(height: 22,),
                Container(
                  width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                  decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(8)),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), elevation: 1,
                        child: Container(
                            height: 58, width: 58, decoration: BoxDecoration(color: primaryBlue.withOpacity(0.5), borderRadius: BorderRadius.circular(15)),
                            child: const Center(child: Icon(Icons.folder_open_rounded, color: white,))),
                      ),
                      const SizedBox(height: 8,),
                      Text("Ejara Flex", textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: primaryBlue),),
                      const SizedBox(height: 13,),
                      Text("20,000CFA", textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17, fontWeight: FontWeight.w800, color: primaryBlue),),
                      const SizedBox(height: 22,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Earnings per day", textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: primaryBlue),),
                          Text("10,000CFA", textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: primaryBlue),),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 22,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Select a payment methods", textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15, fontWeight: FontWeight.w800, color: primaryBlue),),
                ),

                const SizedBox(height: 22,),

                ...List.generate(paymentOption.length, (index){
                  return GestureDetector(
                    onTap: (){
                      index == 1 ? showPaymentOptionBottomSheet(context) : null;
                    },
                    child: EjaraOptionTile(icon: index == 0 ? const Icon(Iconsax.dollar_circle)
                        : index == 1 ? const Icon(Iconsax.mobile) : index == 2 ? const Icon(Iconsax.bank)
                        : index == 3 ? const Icon(Iconsax.card) : const Icon(Iconsax.wallet),
                        title: paymentOption[index]["title"]!,
                        subtitle: paymentOption[index]["subtitle"]!),
                  );
                })
              ],
            ),
          ),
        )
    );
  }
}
