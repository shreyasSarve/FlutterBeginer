import 'package:flutter_animations/animations/animated_butttons.dart';
import 'package:flutter_animations/animations/loading_animation.dart';
import 'package:flutter_animations/animations/ripple_animation.dart';
import 'package:flutter_animations/animations/tween_animation.dart';
import 'package:flutter_animations/animations/wave_text_animation.dart';
import 'package:flutter_animations/model/animation.dart';

List<Anim> animations = [
  Anim(title: "Tween Animation", widget: const TweenAnimation()),
  Anim(title: "Ripple Animation", widget: const RippleAnimation()),
  Anim(title: "Animated Button", widget: const AnimatedButton()),
  Anim(title: "Text Animation", widget: const WavyTextAnimation()),
  Anim(title: "Loding Animation", widget: LoadingAnimation()),
];
