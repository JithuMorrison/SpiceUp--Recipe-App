import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/designs/database.dart';
import 'package:recipe_app/widgets/recipe.dart';
import 'package:recipe_app/recipe_api.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _HomePageState();
}

class _HomePageState extends State<Saved> {
  List<Model> list = <Model>[];
  List<Map<String,dynamic>> response = <Map<String,dynamic>>[];
  getApiData()async{
     response = await DatabaseHelper.instance.queryItems();
    print(response);
    response.forEach((e){
      Model model = Model(
        url: e['url'],
        image: e['image_link'],
        source: e['source'],
        label: e['name'],
      );
      setState(() {
        list.add(model);
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10,),
              Text('Food Recipe'),
            ],
          ),
          backgroundColor: Colors.blue[100],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [const Center(child: Text("Saved Recipes",style: TextStyle(fontSize: 20),)),
                  const SizedBox(height: 15,),
                  GridView.builder(
                      shrinkWrap: true,
                      primary: true,
                      physics: const ScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,crossAxisSpacing: 5,mainAxisSpacing: 5
                      ),
                      itemCount: list.length,
                      itemBuilder: (context,i){
                        final x = list[i];
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewContainer(url: x.url,)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(x.image.toString())),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    height: 50,
                                    color: Colors.black.withOpacity(0.5),
                                    child: Center(child: Text(x.label.toString(),style: const TextStyle(color: Colors.white),)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    height: 50,
                                    color: Colors.black.withOpacity(0),
                                    child: Center(child: ElevatedButton(onPressed: (){
                                      int op=0;
                                      for(Map<String,dynamic> f in response){
                                        if (f['name']==x.label){
                                          op=f['id'];
                                        }
                                      }
                                      Future<int> sp = DatabaseHelper.instance.deleteItems(op);
                                      print(sp);
                                    },style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[600]), child: const Text("Delete",style: TextStyle(color: Colors.white),),)),
                                  ),
                                ]
                            ),
                          ),
                        );
                      })
                ]),
          ),
        ));
  }
}


