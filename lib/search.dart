import 'package:flutter/material.dart';
import 'person.dart';
class searchApp  extends StatefulWidget {
  @override
  searchAppState createState() {
    
     
    return new searchAppState();
  }
}

class searchAppState extends State<searchApp> {

  String temp = "";
  void hoja(){
    setState(() {
          for(int i=0;i<list.length;i++){
          startingdata += "${i+1} name : ${list[i].name} contactNo : ${list[i].contactNo} \n";
                            }
        });
        temp = startingdata;
    
  }
  @override
  void initState() {
    super.initState();
    hoja();

  }

 
  TextEditingController textEditingController = new TextEditingController();
  String search = "";
  String data = "";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        
         appBar: AppBar(
           title: new Text('Search Text'),
         ),
         body: new Column(
        
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
             new TextField(
                controller: textEditingController,
                onChanged: (String text){setState(() {
                        search = text;
                        startingdata = "";
                        if(search == ""){
                            for(int i=0;i<list.length;i++){
                              startingdata += "${i+1} name : ${list[i].name} contactNo : ${list[i].contactNo} \n";
                            }
                        }else{
                           for(int i=0;i<list.length;i++){
                             if(list[i].name.startsWith(search)){
                              startingdata += "${i+1} name : ${list[i].name} contactNo : ${list[i].contactNo} ";
                              }
                            }
                        }                   
                                });
                },
                onSubmitted: (String text){
                    setState(() {
                        search = text;
                        if(search == "")
                        {
                            setState(() {
                                        startingdata = temp;
                                                        });
                        }
                        textEditingController.clear();    
                                        });
                },

             ),
             new Text(startingdata)
           ],
         ),
    );
  }
}