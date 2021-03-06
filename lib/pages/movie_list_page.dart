
import 'package:flutter/material.dart';
import 'package:movies_app/view%20models/movie_list_view_model.dart';
import 'package:movies_app/widgets/movie_list.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  @override 
  _MovieListPageState createState() => _MovieListPageState(); 
}

class _MovieListPageState extends State<MovieListPage> {


  @override
  void dispose() {
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    // you can uncomment this to get all batman movies when the page is loaded
//    Provider.of<MovieListViewModel>(context, listen: false).fetchMovies("batman");
  }

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<MovieListViewModel>(context);

    return Scaffold(

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.grey, 
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                onSubmitted: (value) {
                  if(value.isNotEmpty) {
                    vm.fetchMovies(value);
                  }
                },
//                onChanged: (value) async {
//                  if (value != null && value.isNotEmpty){
//                    await vm.fetchMovies(value);
//                  }
//                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search", 
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none
                ),

              ),
            ), 
            Expanded(
              child: MovieList(movies: vm.movies))
          ])
        ),
      )
   
    );
  }
}