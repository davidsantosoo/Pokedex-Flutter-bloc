import 'package:pokedex_app/bloc/pokemon_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/pokemon_details.dart';

class PokemonDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.green,
      body: BlocBuilder<PokemonDetailsCubit, PokemonDetails>(
        builder: (context, details) {
          return details != null
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 20,
                      left: 5,
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    Positioned(
                        top: 70,
                        left: 20,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              details.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '#00${details.id}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Positioned(
                      top: 110,
                      left: 22,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: details.types
                            .map((type) => _pokemonTypeView(type))
                            .toList(),
                      ),
                    ),
                    Positioned(
                      top: height * 0.18,
                      right: -30,
                      child: Image.asset('images/pokeball.png',
                        height: 200,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: width,
                        height: height * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(

                            children: [
                              SizedBox(height: 50,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: width * 0.3,
                                      child: Text('Name', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                                    ),
                                    Container(
                                      child: Text(details.name, style: TextStyle(color: Colors.black, fontSize: 17),),
                                    ),

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: width * 0.3,
                                      child: Text('Height', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                                    ),
                                    Container(
                                      child: Text('${details.height}', style: TextStyle(color: Colors.black, fontSize: 17),),
                                    ),

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: width * 0.3,
                                      child: Text('Weight', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                                    ),
                                    Container(
                                      child: Text('${details.weight}', style: TextStyle(color: Colors.black, fontSize: 17),),
                                    ),

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: width * 0.3,
                                      child: Text('Description', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
                                    ),
                                    Container(
                                      child: Text('${details.description}', style: TextStyle(color: Colors.black, fontSize: 17),),
                                    ),

                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                     Positioned(
                        top: (height * 0.2),
                        left: (width / 2) - 100,
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image.network(details.imageUrl,width: 200,height: 200,),
                          ],

          ),
          ),
          ])

              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Widget _pokemonTypeView(String type) {
    Color color;


    switch (type) {
      case 'normal':
        color = Color(0xFFbdbeb0);
        break;
      case 'poison':
        color = Color(0xFF995E98);
        break;
      case 'psychic':
        color = Color(0xFFE96EB0);
        break;
      case 'grass':
        color = Color(0xFF9CD363);
        break;
      case 'ground':
        color = Color(0xFFE3C969);
        break;
      case 'ice':
        color = Color(0xFFAFF4FD);
        break;
      case 'fire':
        color = Color(0xFFE7614D);
        break;
      case 'rock':
        color = Color(0xFFCBBD7C);
        break;
      case 'dragon':
        color = Color(0xFF8475F7);
        break;
      case 'water':
        color = Color(0xFF6DACF8);
        break;
      case 'bug':
        color = Color(0xFFC5D24A);
        break;
      case 'dark':
        color = Color(0xFF886958);
        break;
      case 'fighting':
        color = Color(0xFF9E5A4A);
        break;
      case 'ghost':
        color = Color(0xFF7774CF);
        break;
      case 'steel':
        color = Color(0xFFC3C3D9);
        break;
      case 'flying':
        color = Color(0xFF81A2F8);
        break;
      case 'normal':
        color = Color(0xFFF9E65E);
        break;
      case 'fairy':
        color = Color(0xFFEEB0FA);
        break;
      default:
        color = Colors.black;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: color.withOpacity(0.2), borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Text(
          type.toUpperCase(),
          style: TextStyle(color: Colors.white, fontSize: 15),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

}
