import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/app_settings_cubit.dart';

/// App settings page with theme and language toggles.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: BlocBuilder<AppSettingsCubit, AppSettingsState>(
        builder: (context, state) {
          return ListView(
            children: [
              SwitchListTile(
                title: const Text('Dark Theme'),
                value: state.themeMode == ThemeMode.dark,
                onChanged: (_) => context.read<AppSettingsCubit>().toggleTheme(),
              ),
              SwitchListTile(
                title: const Text('Arabic Language'),
                value: state.locale.languageCode == 'ar',
                onChanged: (_) => context.read<AppSettingsCubit>().toggleLanguage(),
              ),
            ],
          );
        },
      ),
    );
  }
}

