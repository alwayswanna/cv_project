import 'package:cv_project/content/contact.dart';
import 'package:cv_project/content/experience.dart';
import 'package:cv_project/content/skills.dart';
import 'package:cv_project/data/personal_data.dart';
import 'package:cv_project/service/config_service.dart';
import 'package:flutter/material.dart';

import '../content/about.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  int _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();
  bool _isMobile = false;
  late Future<PersonalData> _personalData;

  @override
  void initState() {
    super.initState();
    _personalData = ConfigService.loadConfiguration();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isMobile = MediaQuery.of(context).size.width < 600;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _scrollToSection(index);
  }

  void _scrollToSection(int index) {
    final positions = [
      0.0,
      MediaQuery.of(context).size.height * 1,
      MediaQuery.of(context).size.height * 2,
      MediaQuery.of(context).size.height * 3,
    ];

    if (index < positions.length) {
      _scrollController.animateTo(
        positions[index],
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _personalData,
        builder: (context, snapshot) {
          if (ConnectionState.done == snapshot.connectionState) {
            if (snapshot.hasData) {
              return Scaffold(
                appBar: _isMobile
                    ? AppBar(
                        title: const Text('Резюме'),
                        centerTitle: true,
                      )
                    : null,
                drawer: _isMobile ? _buildMobileDrawer() : null,
                body: _buildBody(snapshot.data!),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Ошибка загрузки: ${snapshot.error}'));
            }
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildBody(Object data) {
    if (data is PersonalData) {
      return Row(
        children: [
          if (!_isMobile) _buildDesktopNavigation(),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    buildAboutSection(data),
                    buildSkillsSection(data),
                    buildExperienceSection(data),
                    buildContactsSection(data)
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  Widget _buildDesktopNavigation() {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      onDestinationSelected: _onItemTapped,
      labelType: NavigationRailLabelType.all,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.person),
          label: Text('About'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.code),
          label: Text('Skills'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.work),
          label: Text('Experience'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.contact_mail),
          label: Text('Contacts'),
        ),
      ],
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Меню',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('О себе'),
            onTap: () {
              _onItemTapped(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text('Навыки'),
            onTap: () {
              _onItemTapped(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.work),
            title: const Text('Опыт работы'),
            onTap: () {
              _onItemTapped(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Контакты'),
            onTap: () {
              _onItemTapped(3);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
