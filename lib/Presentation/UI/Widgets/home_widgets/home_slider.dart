import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/Data/model/slider_data.dart';
import 'package:ecommerce/Presentation/UI/Utility/app_color.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
 final List<SliderData> sliders;
  const HomeSlider({super.key, required this.sliders});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (int page, _){
                _selectedSlider.value = page;
              }
          ),
          items:widget.sliders.map((sliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:AppColors.primaryColor.withOpacity(0.4)),
                    child: Stack(
                      children: [
                        Image.network(sliderData.image??""),
                        Positioned(
                          bottom: 0,
                            right: 0,
                            child: Text("${sliderData.title}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),))
                      ],
                    ),);
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8,),
        ValueListenableBuilder(valueListenable: _selectedSlider, builder: (context, value,_){
          List<Widget> list = [];
          for(int i=0; i<widget.sliders.length; i++){
            list.add(Container(
              height: 10,
              width: 10,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: value ==i ? AppColors.primaryColor : null

              ),
            ));
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list,
          );
        }),

      ],
    );
  }
}
