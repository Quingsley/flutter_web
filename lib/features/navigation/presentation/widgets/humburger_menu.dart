import 'package:flutter/material.dart';
import 'package:portfolio/helpers/utils.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HumburgerMenu extends StatelessWidget {
  const HumburgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () => Utils.mainScaffold.currentState!.openDrawer(),
            ),
          )
              .animate()
              .scaleXY(
                  begin: 0,
                  end: 1,
                  duration: .5.seconds,
                  curve: Curves.easeInOut,
                  alignment: Alignment.center)
              .fadeIn(
                duration: .5.seconds,
                curve: Curves.easeInOut,
              )),
    );
  }
}
