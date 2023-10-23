import 'package:ecommerce/Presentation/UI/Utility/app_color.dart';
import 'package:flutter/material.dart';

class ProductColorsList extends StatefulWidget {
  const ProductColorsList({super.key,  this.colors,  this.onSelected,  this.initialSelected});
  final List<String>? colors;
  final Function(int selectedIndex)? onSelected;
  final int? initialSelected;
  static int _selectedColorIndex = 0;
  static int get selectedColorIndex => _selectedColorIndex;

  @override
  State<ProductColorsList> createState() => _ProductColorsListState();
}

class _ProductColorsListState extends State<ProductColorsList> {


  @override
  void initState() {
    ProductColorsList._selectedColorIndex = widget.initialSelected!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.colors!.length,
        itemBuilder: (context, index){
          return InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: (){
              ProductColorsList._selectedColorIndex = index;

              widget.onSelected!(index);
              if(mounted){
                setState(() {
                });
              }
            },
            child: Container(

              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border:Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
                color:  ProductColorsList._selectedColorIndex == index ? AppColors.primaryColor: null,


              ),
              alignment: Alignment.center,
              child: Text(widget.colors![index]),
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 8,
        );
      },),
    );
  }
}
