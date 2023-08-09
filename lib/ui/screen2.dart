import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/Bloc/search_bloc.dart';
import 'package:sports/REPOSITRY/MODELCLASS/searchmodel.dart';

class screen2 extends StatefulWidget {
  const screen2({super.key});

  @override
  State<screen2> createState() => _screen2State();
}

late Searchmodel search;
TextEditingController a = TextEditingController();
List<String> message = [];

class _screen2State extends State<screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
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
                Container(
                  height: 50,
                  width: 280,
                  child: TextFormField(controller: a,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        prefix: GestureDetector(onTap: () {
                          BlocProvider.of<SearchBloc>(context)
                              .add(Fetchsearch(message: a.text));
                        },
                          child: Icon(
                            Icons.search,
                            color: Colors.white60,
                          ),
                        ),
                        hintText: "Search your team",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF65656B),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
          if (state is SearchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SearchError) {
            return RefreshIndicator(
              onRefresh: () async {},
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .9,
                    // color: Colors.red,
                    child:
                    const Center(child: Text('Oops something went wrong'))),
              ),
            );
          }
          if (state is SearchLoaded) {
            search = BlocProvider
                .of<SearchBloc>(context)
                .searchmodel;
            return search.data!.isEmpty ? Text("NO DATA", style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.white),): ListView.builder(
              itemCount: search.data!.length,
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
                              "${search.data![index].logo.toString()}")),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 290,
                            child: Text(
                              "${search.data![index].name.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black87),
                            ),
                          ),
                          Text(
                            search.data![index].managerId == null
                                ? ''
                                : "MANAGER ID : ${search.data![index].managerId
                                .toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black87),
                          ),
                          FittedBox(
                            child: Text(
                              "Catagory id :${search.data![index].categoryId
                                  .toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black87),
                            ),
                          ),
                          FittedBox(
                            child: Text(
                              "Contry :${search.data![index].country
                                  .toString()}",
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
