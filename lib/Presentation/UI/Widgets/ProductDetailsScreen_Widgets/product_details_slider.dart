import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/Presentation/UI/Utility/app_color.dart';
import 'package:flutter/material.dart';

class ProductDetailsSlider extends StatefulWidget {
  final List<String> imageList;

  const ProductDetailsSlider({super.key, required this.imageList});

  @override
  State<ProductDetailsSlider> createState() => _ProductDetailsSliderState();
}

class _ProductDetailsSliderState extends State<ProductDetailsSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (int page, _) {
                    _selectedSlider.value = page;
                  }),
              items: widget.imageList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration:  BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(image: NetworkImage(i))),
                      alignment: Alignment.center,
                    );
                  },
                );
              }).toList(),
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: ValueListenableBuilder(
                  valueListenable: _selectedSlider,
                  builder: (context, value, _) {
                    List<Widget> list = [];
                    for (int i = 0; i < 5; i++) {
                      list.add(Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            color: value == i
                                ? AppColors.primaryColor
                                : Colors.white),
                      ));
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: list,
                    );
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
