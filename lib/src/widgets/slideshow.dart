
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;

  const Slideshow(
      {Key? key, required this.slides,
      this.puntosArriba = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderShowModelM(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SliderShowModelM>(context).colorPrimario =
                  colorPrimario;
              Provider.of<_SliderShowModelM>(context).colorSecundario =
                  colorSecundario;
              return _CrearEstructura(puntosArriba: puntosArriba, slides: slides);
            },
        ),
      ),
    ));
  }
}

class _CrearEstructura extends StatelessWidget {
  const _CrearEstructura({
    Key? key,
    required this.puntosArriba,
    required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (puntosArriba) _Docts(slides.length),
        //_Docts(this.slides.length),
        Expanded(child: _Slides(slides)),
        if (!puntosArriba) _Docts(slides.length),
      ],
    );
  }
}

class _Docts extends StatelessWidget {
  final int totalSlides;

  const _Docts(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      // color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        // children: [
        //   // ignore: prefer_const_constructors
        //   _Dot(index: 0),
        //   // ignore: prefer_const_constructors
        //   _Dot(index: 1),
        //   // ignore: prefer_const_constructors
        //   _Dot(index: 2),
        // ],

        children: List.generate(totalSlides, (index) => _Dot(index: index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  // final Color colorPrimario;
  // final Color colorSecudario;

  const _Dot({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<_SliderShowModelM>(context).currentPage;
    final ssModel= Provider.of<_SliderShowModelM>(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (pageViewIndex >= index - 0.5 && ssModel._currentPage < index + 0.5)
              ? ssModel._colorPrimario
              : ssModel._colorSecundario,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  //const _Slides({ Key? key }) : super(key: key);

  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();

    
    pageViewController.addListener(() {
      Provider.of<_SliderShowModelM>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: PageView(
        controller: pageViewController,

        // children: const [
        //   _Slide('assets/slide-1.svg'),
        //    _Slide('assets/slide-2.svg'),
        //     _Slide('assets/slide-3.svg'),
        //  // SvgPicture.asset('assets/slide-2.svg'),
        //   //SvgPicture.asset('assets/slide-3.svg'),
        // ],

        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SliderShowModelM with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  Color get colorPrimario => _colorPrimario;
  set colorPrimario(Color color) {
    _colorPrimario = color;
    //notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  Color get colorSecundario => _colorSecundario;
  set colorSecundario(Color color) {
    _colorSecundario = color;
   // notifyListeners();
  }
}
