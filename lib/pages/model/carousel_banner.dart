import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselBanner extends StatelessWidget {
  const CarouselBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15),
        height: MediaQuery.of(context).size.height * 0.28,
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 2),
            disableCenter: false,
            pauseAutoPlayInFiniteScroll: true,
            viewportFraction: 2,
          ),
          items: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.only(right: 10, left: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/img/mercedes_1.jpg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.95,
                  ),
                )),
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.only(right: 10, left: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/img/toyota_1.jpg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.95,
                  ),
                )),
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.only(right: 10, left: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/img/honda_1.jpg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.95,
                  ),
                )),
          ],
        ));
  }
}
