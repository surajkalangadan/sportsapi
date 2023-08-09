import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/Bloc/sports_bloc.dart';
import 'package:sports/REPOSITRY/MODELCLASS/Sportsmodel.dart';
import 'package:sports/ui/screen2.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

late Sportsmodel sports;

class _screen1State extends State<screen1> {
  @override
  void initState() {
    BlocProvider.of<SportsBloc>(context).add(Fetchsports());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Center(
            child: Text(
              "Sporty",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
          ),
          title: Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.grey),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx)=>screen2()));
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<SportsBloc, SportsState>(builder: (context, state) {
          if (state is SportsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SportsError) {
            return RefreshIndicator(
              onRefresh: () async {
                return BlocProvider.of<SportsBloc>(context).add(Fetchsports());
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * .9,
                    // color: Colors.red,
                    child:
                        const Center(child: Text('Oops something went wrong'))),
              ),
            );
          }
          if (state is SportsLoaded) {
            sports = BlocProvider.of<SportsBloc>(context).sportsmodel;
            return ListView.builder(
              itemCount: sports.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 150,
                  width: 325,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.pinkAccent, width: 2),
                      color: Colors.white),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 150,
                          width: 150,
                          color: Colors.black,
                          child: Image.network(
                              "${sports.data![index].logo.toString()}")),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 290,
                            child: Text(
                              "${sports.data![index].name.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black87),
                            ),
                          ),
                          Text(
                            sports.data![index].managerId == null
                                ? ''
                                : "MANAGER ID : ${sports.data![index].managerId.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black87),
                          ),
                          FittedBox(
                            child: Text(
                              "Catagory id :${sports.data![index].categoryId.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black87),
                            ),
                          ),
                          FittedBox(
                            child: Text(
                              "Contry :${sports.data![index].country.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black87),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return SizedBox();
          }
        }));
  }
}
