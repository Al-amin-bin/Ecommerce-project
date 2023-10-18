import 'package:ecommerce/Presentation/UI/Utility/color_extention.dart';
import 'package:flutter/material.dart';

class ProductColorList extends StatefulWidget {
  final List<String>colorList;
  const ProductColorList({super.key, required this.colorList});

  static int _selectedColorIndex = 0;
  static int get selectedColorIndex => _selectedColorIndex;
  @override
  State<ProductColorList> createState() => _ProductColorListState();
}

class _ProductColorListState extends State<ProductColorList> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView.separated(

        scrollDirection: Axis.horizontal,
        itemCount: widget.colorList.length,
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              ProductColorList._selectedColorIndex = index;
              if(mounted){
                setState(() {
                });
              }
            },
            child: CircleAvatar(
              radius: 18,
              backgroundColor: HexColor.fromHex(widget.colorList[index]),
              child: ProductColorList._selectedColorIndex== index ? const Icon(Icons.done,color: Colors.white,):null ,

            ),
          );
        }, separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 10,);
      },),

    );
  }
}
