import 'package:pokedex_app/bloc/pokemon_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/nav_cubit.dart';
import '../bloc/pokemon_state.dart';

class PokedexView extends StatelessWidget {
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
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonPageLoadSuccess) {
            return Stack(
                children: [
                  Positioned(top: -50,
                    right: -50,
                    child: Image.asset('images/pokeball.png',
                      width: 200,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                      top: 100,
                      left: 20,
                      child: Text('Pokedex', style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),)
                  ),
                  Positioned(
                    top: 150, bottom: 0,
                    child: SizedBox(
                      height: height,
                      width: width,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.4),
                        itemCount: state.pokemonListings.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: InkWell(
                            child: SafeArea(
                             child: Container(

                                decoration: BoxDecoration(
                                color: Colors.green,

                                borderRadius: BorderRadius.all(Radius.circular(25))
                                ),


                          child: Stack(
                              children: [

                                  Positioned(
                                  bottom: -10,
                                  right: -10,
                                  child: Image.asset('images/pokeball.png',
                                  height: 100,
                                  fit: BoxFit.fitHeight,

                                  ),
                                  ),
                                    Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child:  Image.network(
                                        state.pokemonListings[index].imageUrl,
                                        height: 100,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  Positioned(
                                      top: 30,
                                      left: 15,
                                      child: Text(state.pokemonListings[index].name,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white,
                                      shadows: [
                                        BoxShadow(
                                        color: Colors.blueGrey,
                                        offset: Offset(0,0),
                                        spreadRadius: 1.0,
                                        blurRadius: 15
                                        )
                                      ]
                                  ),

                                  ),
                                  ),


                                 ],
                               ),
                             ),
                          ),
                            onTap: () => BlocProvider.of<NavCubit>(context)
                                .showPokemonDetails(state.pokemonListings[index].id),
                          )
                          );
                        },



                      ),
                    ),
                  ),

                ]
            );
          } else if (state is PokemonPageLoadFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
