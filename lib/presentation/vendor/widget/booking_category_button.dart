import 'package:ejara_test_project/app/shared/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class BookingCategoryButton extends StatelessWidget {
  final int? selected;
  final Function? callback;
  final List<String>? category;
  const BookingCategoryButton({this.selected, this.callback, this.category, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(color: Color(0xffE6E6E6),borderRadius: BorderRadius.circular(100)),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => callback!(index),
          child: Container(
              width: 100,
              padding: EdgeInsets.symmetric(
                // horizontal: index == selected ? 32 : 0, vertical: 7),
                  horizontal: 10, vertical: 14
              ),
              decoration: BoxDecoration(
                  color: index == selected && selected == 0
                      ? tulipTree : index == selected && selected == 1 ? greenPea
                      : index == selected && selected == 2 ? persianRed : Colors.transparent,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Text(
                  category![index],
                  style: TextStyle(
                      color: index == selected
                          ? white
                          : dustyGray,
                      fontFamily: 'Euclid Circular',
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              )),
        ),
        separatorBuilder: (_, __) => SizedBox(
          width: 10,
        ),
        itemCount: category!.length,
      ),
    );
  }
}
