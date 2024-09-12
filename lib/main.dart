import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'comercial.dart';
import 'equipe.dart';
import 'estrutura.dart';
import 'perfil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Move Management',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoSlabTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
            primary: const Color.fromRGBO(240, 40, 30, 1),
            secondary: const Color.fromRGBO(125, 25, 30, 1),
            tertiary: const Color.fromRGBO(255, 200, 15, 1),
            tertiaryContainer: const Color.fromARGB(255, 150, 100, 7)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String pagename = "comercial";

  late Widget page;

  @override
  Widget build(BuildContext context) {
    switch (pagename) {
      case "comercial":
        page = const ComercialPage();
      case "equipe":
        page = const EquipePage();
      case "estrutura":
        page = const EstruturaPage();
      case "perfil":
        page = const PerfilPage();
    }
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          "Move Management",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          print("Chat clicked");
        },
        backgroundColor: Colors.yellow,
        tooltip: "Assistente",
        child: const Icon(
          Icons.chat_rounded,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.primary,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              tooltip: "Comercial",
              onPressed: () {
                print("Comercial clicked!");
                setState(() {
                  pagename = "comercial";
                });
              },
              icon: Icon(
                Icons.attach_money_rounded,
                color: pagename == "comercial"
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.tertiaryContainer,
                size: 30,
              ),
            ),
            IconButton(
              tooltip: "Equipe",
              onPressed: () {
                print("Equipe clicked!");
                setState(() {
                  pagename = "equipe";
                });
              },
              icon: Icon(
                Icons.account_tree,
                color: pagename == "equipe"
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.tertiaryContainer,
                size: 30,
              ),
            ),
            IconButton(
              tooltip: "Estrutura",
              onPressed: () {
                print("Estrutura clicked!");
                setState(() {
                  pagename = "estrutura";
                });
              },
              icon: Icon(
                Icons.store,
                color: pagename == "estrutura"
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.tertiaryContainer,
                size: 30,
              ),
            ),
            IconButton(
              tooltip: "Perfil",
              onPressed: () {
                print("Perfil clicked!");
                setState(() {
                  pagename = "perfil";
                });
              },
              icon: Icon(
                Icons.person,
                color: pagename == "perfil"
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.tertiaryContainer,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: page,
    );
  }
}
