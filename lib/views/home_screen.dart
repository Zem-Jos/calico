import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/authentication_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future<PokemonIndex>? pokemonIndex;

  // @override
  // void initState() {
  //   super.initState();
  //   pokemonIndex = PokemonApi.fetchPokemon(0);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: SideDrawer(),
        appBar: AppBar(
          title: Text(
            'Calico',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'Home Screen',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
              ),
              ElevatedButton(
                  onPressed: () {
                    AuthController.instance.logout();
                  },
                  child: Text('Logout'))
            ],
          ),
        ));
  }
}

// TextField(
//               // controller: controller,
//               decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.search),
//                   hintText: 'Search Pokemon'),
//             ),