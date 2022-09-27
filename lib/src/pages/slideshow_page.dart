

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/slideshow.dart';


class   SlidePagee extends StatelessWidget {
  const SlidePagee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(
        puntosArriba: true,
        colorPrimario: const Color.fromARGB(255, 0, 0, 0),
        colorSecundario: const Color.fromARGB(255, 255, 0, 0),
        slides: [

           SvgPicture.asset('assets/slide-1.svg'),
            SvgPicture.asset('assets/slide-2.svg'),
             SvgPicture.asset('assets/slide-3.svg'),
              SvgPicture.asset('assets/slide-4.svg'),
               SvgPicture.asset('assets/slide-5.svg'),
        //    _Slide('assets/slide-2.svg'),
        //     _Slide('assets/slide-3.svg'),

        ],
      )
      
  
    );
  }
}