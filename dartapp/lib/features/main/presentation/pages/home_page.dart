import 'package:dartapp/features/main/presentation/bloc/screen_data_bloc.dart';
import 'package:dartapp/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = '';
  String text = '';
  ScreenDataBloc bloc = getIt<ScreenDataBloc>();

  @override
  void initState() {
    bloc.add(const GetScreenDataEvent(1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: bloc,
        listener: (context, state) {
          if (state is LoadedScreenDataState) {
            title = state.data.title;
            text = state.data.text;
          }
        },
        builder: (context, state) {
          if (state is LoadingScreenDataState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LoadedScreenDataState) {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.amber,
                  elevation: 10,
                  title: Text(title),
                ),
                body: Center(child: Text(text)));
          }
          if (state is EmptyScreenDataState) {
            return const SizedBox();
          }
          return const Placeholder();
        });
  }
}
