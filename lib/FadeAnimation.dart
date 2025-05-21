import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart'; // Importa la librería simple_animations

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  // Constructor
  const FadeAnimation(this.delay, this.child, {super.key}); // Añade super.key para evitar warnings

  @override
  Widget build(BuildContext context) {
    // Definimos un Tween para la opacidad y otro para la traslación vertical
    // Usamos MovieTween para combinar múltiples animaciones
    final movieTween = MovieTween()
      ..tween(
        'opacity', // Nombre del tween
        Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
      )
      ..tween(
        'translateY', // Nombre del tween
        Tween(begin: 120.0, end: 0.0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );

    return CustomAnimationBuilder(
      duration: movieTween.duration,
      delay: Duration(milliseconds: (500 * delay).round()),
      tween: movieTween,
      child: child,
      builder: (context, value, child) {
        return Opacity(
          opacity: value.get('opacity'), // Accede a la opacidad por su nombre
          child: Transform.translate(
            offset: Offset(0, value.get('translateY')), // Accede a translateY
            child: child,
          ),
        );
      },
    );
  }
}