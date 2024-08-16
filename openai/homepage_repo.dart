import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


abstract class HomePageRepository{
  Future<dynamic> askAI(String prompt);
}

class HomePageRepo extends HomePageRepository{
  @override
  Future<dynamic> askAI(String prompt) async{
    try{
      final response = await http.post(
          Uri.parse('OpenAI url'),
          headers:{
            'Content-Type':'application/json',
            'Authorization': 'Bearer ${dotenv.env['token']}'
          },
          body: jsonEncode(
            {
              'model':'gpt-3.5-turbo-instruct',
              'prompt':'Create a recipe from a list of ingredients:\n$prompt',
              'max_tokens':250,
              "temperature":0,
              "top_p":1,
            },
          )
      );
      print(response.body);
      final data = jsonDecode(response.body);
      final firstChoiceText = data['choices'][0]['text'];
      return firstChoiceText;
    } catch(e){
      return e.toString();
    }
  }
}