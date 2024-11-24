import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_guide_2024/helpers/preferences.dart';
import 'package:flutter_guide_2024/providers/people_provider.dart';
import 'package:flutter_guide_2024/providers/theme_provider.dart';
import 'package:flutter_guide_2024/screens/people_screen.dart';
import 'package:flutter_guide_2024/screens/screens.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initShared();
  await dotenv.load();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(isDarkMode: Preferences.darkmode),
      ),
      ChangeNotifierProvider<PeopleProvider>(
        create: (_) => PeopleProvider(),
        lazy: false,
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Provider.of<ThemeProvider>(context, listen: true);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        /* theme: Preferences.darkmode ? ThemeData.dark() : ThemeData.light(), */
        theme: tema.temaActual,
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
          'alert': (context) => const AlertScreen(),
          'animated_container': (context) => const AnimatedContainerScreen(),
          'infinite_scroll': (context) => const InfiniteScrollScreen(),
          'custom_list': (context) => CustomListScreen(),
          'provider_navigation_bar': (context) => BottomNavigationScreen(),
          'provider_navigation_bar_provider': (context) =>
              BottomNavigationProvider(),
          'profile': (context) => const ProfileScreen(),
          'custom_list_item': (context) => CustomListItem(),
          'list_people': (context) => const ListPeopleScreen(),
          'lista_fotos': (context) => const ListaFotosScreen(),
          'page_view': (context) => PageViewScreen(),
          'sliver': (context) => const SliversScreen(),
          'people_screen': (context) => const PeopleDetailScreen(),
        }
        /* home: DesignScreen(), */
        );
  }
}
