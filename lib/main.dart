import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/screens/material_screen.dart';
import 'package:flutter_guide_2024/screens/screens.dart';
import 'package:flutter_guide_2024/screens/social_media_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomeScreen(),
          'design': (context) => const DesignScreen(),
          'listview_builder': (context) => const ListViewBuilderScreen(),
          'listview_separated': (context) => const ListViewSeparatedScreen(),
          'list_card': (context) => const ListCardScreen(),
          'material_library': (context) => const MaterialScreen(),
          'counter': (context) => const CounterScreen(),
          'flexbox': (context) => const FlexboxScreen(),
          'swipper_card': (context) => const SwipperScreen(),
          'stack': (context) => const StackScreen(),
<<<<<<< Updated upstream
          'alert': (context) => const AlertScreen(),
          'animated_container': (context) => const AnimatedContainerScreen(),
          'infinite_scroll': (context) => const InfiniteScrollScreen(),
          'custom_list': (context) => CustomListScreen()
=======
          'social_media_screen': (context) => const SocialMediaScreen(),
>>>>>>> Stashed changes
        }
        /* home: DesignScreen(), */
        );
  }
}
