import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/widgets/recipe.dart';
import 'package:recipe_app/recipe_api.dart';

import 'designs/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Model> list = <Model>[];
  final url = "API";
  getApiData()async{
  var response = await http.get(Uri.parse(url));
  Map json = jsonDecode(response.body);
  print(response.body);
  json['hits'].forEach((e){
    Model model = Model(
      url: e['recipe']['url'],
      image: e['recipe']['image'],
      source: e['recipe']['source'],
      label: e['recipe']['label'],
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
              children: [const Center(child: Text("Popular Recipes",style: TextStyle(fontSize: 20),)),
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
                  Future<int> so= DatabaseHelper.instance.insertHist({'name':x.label,'image_link':x.image,'url':x.url,'source':x.source});
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
                          Future<int> s= DatabaseHelper.instance.insertItems({'name':x.label,'image_link':x.image,'url':x.url,'source':x.source});
                          print(s);
                        },style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[600]), child: const Text("Save",style: TextStyle(color: Colors.white),),)),
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


