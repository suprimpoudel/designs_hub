import 'package:designs_hub/feature/home/domain/use_cases/bottom_navigation_toggle_use_case.dart';
import 'package:designs_hub/feature/home/presentation/manager/bottom_navigation_bloc.dart';
import 'package:designs_hub/feature/home/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, int>(
        builder: (context, navigationState) {
      return Scaffold(
        body: navigationState == 2 ? const SettingsPage() : const Placeholder(),
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationState,
          onDestinationSelected: (index) {
            context.read<BottomNavigationBloc>().add(
                  BottomNavigationToggleUseCase(
                    index,
                  ),
                );
          },
          destinations: const <NavigationDestination>[
            NavigationDestination(
              selectedIcon: Icon(Icons.explore),
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            NavigationDestination(
              selectedIcon: Icon(FontAwesomeIcons.heart),
              icon: Icon(FontAwesomeIcons.heart),
              label: 'Favorites',
            ),
            NavigationDestination(
              selectedIcon: Icon(FontAwesomeIcons.gear),
              icon: Icon(FontAwesomeIcons.gear),
              label: 'Settings',
            ),
          ],
        ),
      );
    });
  }
}
