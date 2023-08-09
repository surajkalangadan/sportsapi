import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/Bloc/manager%20bloc/search1_bloc.dart';
import 'package:sports/REPOSITRY/MODELCLASS/Search1model.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}
late Search1model search1;
TextEditingController b = TextEditingController();
List<String> message = [];

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: FittedBox(
          child: Text(
            "MANAGERS",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent),
          ),
        ),
        title: Container(
          height: 50,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 50,
              width: 300,
              color: Colors.grey,
              child: TextFormField(controller: b,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefix: GestureDetector(onTap: () {
                BlocProvider.of<Search1Bloc>(context)
                    .add(Fetchsearch1(message: b.text));
                },
                child: Icon(
                  Icons.search,
                  color: Colors.white60,
                ),
              ),
                    hintText: "search your manager",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
          ]),
        ),
      ),
      body: BlocBuilder<Search1Bloc, Search1State>(builder: (context, state) {
        if (state is Search1Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is Search1Error) {
          return RefreshIndicator(
            onRefresh: () async {
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
        if (state is Search1Loaded) {
          search1 = BlocProvider.of<Search1Bloc>(context).search1model;
          return ListView.builder(
            itemCount: search1.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Container(
                    height: 140,
                    width: 270,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 140,
                          width: 140,
                          child: Image.network(
                              search1.data![index].photo.toString()),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "NAME  :  ${search1.data![index].name.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.brown),
                            ),
                            Text(
                              "DATE OF BIRTH  : ${search1.data![index].dateBirth.toString()} ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.brown),
                            ),
                            Text(
                              "PERFORMANCE  : ${search1.data![index].performance.toString()} ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.brown),
                            ),
                            Text(
                              "sportId  :  ${search1.data![index].sportId.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.brown),
                            )
                          ],
                        )
                      ],
                    )),
              );
            },
          );
        } else {
          return SizedBox();
        }
      }),
    );
  }
}
