import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/REPOSITRY/MODELCLASS/Managermodel.dart';

import '../Bloc/manager bloc/mnager_bloc.dart';

class manager extends StatefulWidget {
  const manager({super.key});

  @override
  State<manager> createState() => _managerState();
}

late Managermodel managername;

class _managerState extends State<manager> {
  @override
  void initState() {
    BlocProvider.of<ManagerBloc>(context).add(Fetchmanager());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Container(
          height: 50,
          width: 50,
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Manager, list",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple),
        ),
      ),
      body: BlocBuilder<ManagerBloc, ManagerState>(builder: (context, state) {
        if (state is ManagerLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ManagerError) {
          return RefreshIndicator(
            onRefresh: () async {
              return BlocProvider.of<ManagerBloc>(context).add(Fetchmanager());
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
        if (state is ManagerLoaded) {
          managername = BlocProvider.of<ManagerBloc>(context).managermodel;
          return ListView.builder(
            itemCount: managername.data!.length,
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
                              managername.data![index].photo.toString()),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "NAME  :  ${managername.data![index].name.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.brown),
                            ),
                            Text(
                              "DATE OF BIRTH  : ${managername.data![index].dateBirth.toString()} ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.brown),
                            ),
                            Text(
                              "PERFORMANCE  : ${managername.data![index].performance.toString()} ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.brown),
                            ),
                            Text(
                              "sportId  :  ${managername.data![index].sportId.toString()}",
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
