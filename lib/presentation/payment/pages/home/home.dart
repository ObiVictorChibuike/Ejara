import 'package:ejara_test_project/app/shared/app_colors/app_colors.dart';
import 'package:ejara_test_project/app/shared/widgets/ejara_primary_button.dart';
import 'package:ejara_test_project/app/shared/widgets/empty_screen.dart';
import 'package:ejara_test_project/app/shared/widgets/error_screen.dart';
import 'package:ejara_test_project/app/shared/widgets/loading_widget.dart';
import 'package:ejara_test_project/core/state/view_state.dart';
import 'package:ejara_test_project/presentation/payment/pages/widget/dexter_bottom_sheet.dart';
import 'package:ejara_test_project/presentation/payment/pages/widget/ejara_option_tile.dart';
import 'package:ejara_test_project/presentation/payment/viewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import 'add_method.dart';

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
          body: ChangeNotifierProvider(create: (BuildContext context) => HomeViewModel(),
            child: Builder(builder: (context){
              final paymentMethod = Provider.of<HomeViewModel>(context);
              void showPaymentOptionBottomSheet(BuildContext context){
                MyBottomSheet().showNonDismissibleBottomSheet(context: context, height: MediaQuery.of(context).size.height/1.5,
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
                      paymentMethod.paymentSettingsPerMethodViewState.data!.data!.isNotEmpty ?
                      Column(
                        children: [
                          ...List.generate(moneyMethod.length, (index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  height: 55, width: double.maxFinite,
                                  decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 10, width: 10,
                                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: dustyGray)),
                                      ),
                                      const SizedBox(width: 10),
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
                          const SizedBox(height: 25),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(height: 1,  width: MediaQuery.of(context).size.width / 3, color: dustyGray,),
                              Text("Or", style: Theme.of(context).textTheme.bodyText1!.copyWith(color: shark, fontSize: 14, fontWeight: FontWeight.w400)),
                              Container(height: 1,  width: MediaQuery.of(context).size.width / 3, color: dustyGray,),
                            ],
                          ),
                          const SizedBox(height: 30),
                          EjaraPrimaryButton(
                            btnWidth: double.maxFinite, btnHeight: 50,
                            btnColor: primaryBlue.withOpacity(0.4),
                            btnTitle: "+ Another mobile money method",
                            buttonBorder: primaryBlue.withOpacity(0.4),
                          ),
                          const SizedBox(height: 30),
                          EjaraPrimaryButton(
                            onTap: (){
                              Navigator.of(context).pop();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddMethod()));
                            },
                            buttonBorder: primaryBlue, btnTitle: "Continue",
                            borderRadius: 15, titleColor: white, btnHeight: 56, btnTitleSize: 16,
                          ),
                        ],
                      ) : const EmptyScreen(emptyScreenMessage: "No Data",),
                    ]
                );
              }
              if(paymentMethod.viewState.state == ResponseState.LOADING){
                return const LoadingWidget(loadingMessage: "Loading",);
              }else if (paymentMethod.viewState.state == ResponseState.COMPLETE){
                return Padding(
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

                      ...List.generate(paymentMethod.viewState.data!.data!.length, (index){
                        final data = paymentMethod.viewState.data!.data!;
                        return GestureDetector(
                          onTap: () async {
                            await paymentMethod.getPaymentSettingsPerMethod(id: data[index].id.toString());
                            showPaymentOptionBottomSheet(context);
                          },
                          child: EjaraOptionTile(icon: index == 0 ? const Icon(Iconsax.dollar_circle)
                              : index == 1 ? const Icon(Iconsax.mobile) : index == 2 ? const Icon(Iconsax.bank)
                              : index == 3 ? const Icon(Iconsax.card) : const Icon(Iconsax.wallet),
                              title: data[index].titleEn!,
                              subtitle: data[index].descriptionEn!),
                        );
                      })
                    ],
                  ),
                );
              }else if(paymentMethod.viewState.state == ResponseState.EMPTY){
                return const EmptyScreen(emptyScreenMessage: "No Data",);
              }else if(paymentMethod.viewState.state == ResponseState.ERROR){
                return const ErrorScreen();
              }return const SizedBox.shrink();
            },),
          ),
        )
    );
  }
}
