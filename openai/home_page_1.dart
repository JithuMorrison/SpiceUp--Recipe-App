import 'package:flutter/material.dart';
import 'package:recipe_app/components/mybottomnavbar.dart';
import 'dart:math' as math;

import 'homepage_repo.dart';

class HomePage4 extends StatefulWidget {
  const HomePage4({super.key});

  @override
  State<HomePage4> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage4> {
  late TextEditingController controller;
  late FocusNode focusNode;
  final List<String> inputTags = [];
  String response = '';

  @override
  void initState() {
    controller = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
            child:Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                      children: [
                        const Text(
                          'Find the best recipe for cooking!',
                          maxLines: 3,
                          style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                autofocus: true,
                                autocorrect: true,
                                focusNode: focusNode,
                                controller: controller,
                                onFieldSubmitted: (value) {
                                  setState(() {
                                    inputTags.add(value);
                                    focusNode.requestFocus();
                                  });
                                  controller.clear();
                                  print(inputTags);
                                  print("value: ${controller.text}");
                                },
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context) . colorScheme.primary,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(5.5),
                                            bottomLeft: Radius.circular(5.5))), // Border
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                    labelText: "Enter your ingredients you have:",
                                    labelStyle: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                    )),
                              ),
                            ),
                            Container(
                              color: Theme.of (context) . colorScheme. primary,
                              child: Padding(
                                padding: const EdgeInsets.all(9),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      inputTags.add(controller.text);
                                      focusNode. requestFocus ();
                                    });
                                    controller.clear();
                                    print(inputTags);
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Wrap(
                            children: [
                              for (int i = 0; i < inputTags. length; i++)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Chip(
                                    backgroundColor: Color(
                                        (math.Random( ) .nextDouble() * 0xFFFFFF)
                                            .toInt()) // Color
                                        .withOpacity(0.1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.5)), // R
                                    onDeleted: (){
                                      setState(() {
                                        inputTags.remove(inputTags[i]);
                                        print(inputTags);
                                      });
                                    },
                                    label: Text(inputTags[i]),
                                    deleteIcon: const Icon(
                                      Icons.close,
                                      size: 20,
                                    ), // Icon
                                  ),// Chip
                                ), // Padding
                            ],
                          ),
                        ),
                        Expanded(
                            child: SizedBox(
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Text(
                                    response,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                )     ,
                              )   ,
                            )
                        ),
                        const SizedBox(height: 20,),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                                child:const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.auto_awesome,size: 30,),
                                    Text('Create Recipe'),
                                  ],
                                ),
                                onPressed: () async{
                                  setState(() => response = 'Thinking...');
                                  var temp= await HomePageRepo().askAI(inputTags.toString());
                                  setState(() => response = temp);
                                })),

                      ] ),
                )
            )
        ),
    bottomNavigationBar: const MyBottomNavBar(),);
  }
}


