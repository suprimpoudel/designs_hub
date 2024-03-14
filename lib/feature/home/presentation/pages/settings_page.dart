import 'dart:io';

import 'package:designs_hub/common/utilities/extensions/context_extension.dart';
import 'package:designs_hub/feature/dark_mode/domain/use_cases/toggle_theme_use_case.dart';
import 'package:designs_hub/feature/dark_mode/presentation/manager/toggle_theme_bloc.dart';
import 'package:designs_hub/feature/dark_mode/utilities/theme_enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            title: Text(
              "Settings",
              style: TextStyle(
                color: context.getInverseColor,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child:
              BlocBuilder<ToggleThemeBloc, AppTheme>(builder: (context, state) {
            return ListTile(
              leading: Icon(
                state == AppTheme.dark
                    ? FontAwesomeIcons.moon
                    : FontAwesomeIcons.sun,
                color:
                    state == AppTheme.dark ? Colors.white : Colors.deepOrange,
              ),
              title: const Text("Dark Mode"),
              trailing: Platform.isAndroid
                  ? Switch(
                      value: state == AppTheme.dark,
                      onChanged: (value) {
                        context
                            .read<ToggleThemeBloc>()
                            .add(ToggleThemeUseCase());
                      },
                    )
                  : CupertinoSwitch(
                      value: state == AppTheme.dark,
                      onChanged: (value) {
                        context
                            .read<ToggleThemeBloc>()
                            .add(ToggleThemeUseCase());
                      },
                    ),
            );
          }),
        ),
      ],
    );
  }
}
