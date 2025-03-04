
import 'package:chaqchuq/app/pages/application/bloc/application_bloc.dart';

import 'package:chaqchuq/app/pages/application/bloc/application_state.dart';
import 'package:chaqchuq/app/pages/application/widgets/bottomnavigationbar.dart';
import 'package:chaqchuq/app/pages/application/widgets/widgets.dart';

import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
    @override
    Widget build(BuildContext context) {
        final customColors = Theme.of(context).extension<CustomColors>()!;
        return BlocBuilder<ApplicationBloc, ApplicationState>(
            builder: (context, state) {
                return Scaffold(
                    backgroundColor: customColors.backgroundColor,
                    body: Center(
                        child: buildPage(state.index),
                    ),
                    bottomNavigationBar: CustomBottomNavigationBar(customColors: customColors),
                );
            },
        );
    }
}
