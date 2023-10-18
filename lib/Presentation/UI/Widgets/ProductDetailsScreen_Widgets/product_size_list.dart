import 'package:ecommerce/Presentation/UI/Utility/app_color.dart';
import 'package:flutter/material.dart';

class ProductSizeList extends StatefulWidget {
  const ProductSizeList({super.key,  this.size,  this.onSelected,  this.initialSelected});
  final List<String>? size;
  final Function(int selectedIndex)? onSelected;
  final int? initialSelected;
  static int _selectedIndex = 0;
  static int get selectedIndex => _selectedIndex;

  @override
  State<ProductSizeList> createState() => _ProductSizeListState();
}

class _ProductSizeListState extends State<ProductSizeList> {


  @override
  void initState() {
    ProductSizeList._selectedIndex = widget.initialSelected!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.size!.length,
        itemBuilder: (context, index){
          return InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: (){
              ProductSizeList._selectedIndex = index;

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
                color:  ProductSizeList._selectedIndex == index ? AppColors.primaryColor: null,


              ),
              alignment: Alignment.center,
              child: Text(widget.size![index]),
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
