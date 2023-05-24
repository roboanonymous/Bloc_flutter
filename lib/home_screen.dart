import 'package:blflutter/blocs/internet_bloc/internet_bloc.dart';
import 'package:blflutter/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if(state is InternetGainedState){
              return Text("Internet Connected");
            }
            else if(state is InternnetLostState){
              return Text("Internet not connected");
            }
            else{
              return Text("Loading");
            }
          },
        ),
      )),
    );
  }
}
