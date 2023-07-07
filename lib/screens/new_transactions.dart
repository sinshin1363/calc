import 'dart:math';

import 'package:calc_application/homescreen.dart';
import 'package:calc_application/models/money.dart';

import 'package:flutter/material.dart';

class NewTransactionsScreen extends StatefulWidget {
  const NewTransactionsScreen({super.key});
  static int groupId = 0;
   static TextEditingController descriptionController = TextEditingController();
   static TextEditingController priceController = TextEditingController();
   

  @override
  State<NewTransactionsScreen> createState() => _NewTransactionsScreenState();
}

class _NewTransactionsScreenState extends State<NewTransactionsScreen> {
  @override
  
  Widget build(BuildContext context) {
    return   SafeArea(
      child:  Scaffold(
        backgroundColor: Colors.white,
        body: Padding(padding: const EdgeInsets.all(25),
          child: SizedBox(width: double.infinity,
            child:  
              Column(crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                const Text('تراکنش جدید ', style: TextStyle(fontSize: 18)
                  ,),
                   MyTextfield(hinttext: 'توضیحات', controller: NewTransactionsScreen.descriptionController , 
                   ),
                    MyTextfield(hinttext: 'مبلغ',type: TextInputType.number, controller: NewTransactionsScreen.priceController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                       MyRadioWidget(
                        groupValue: NewTransactionsScreen.groupId,
                         value:1,
                          onChanged: (value){
                            setState(() {
                              NewTransactionsScreen.groupId = value!;
                              
                            });
                          },
                        
                          ),
                          const Text('دریافتی'),
                       MyRadioWidget(
                        groupValue: NewTransactionsScreen.groupId,
                         value:2,
                        onChanged: (value){
                        setState(() {
                          NewTransactionsScreen.groupId = value!;
                          
                        });
                       }),
                          const Text('پرداختی'),



                        Padding(padding: const EdgeInsets.all(15),
                         child: OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.grey) ,
                            ),

                           onPressed: (){

                           }, 
                             child: const Text('تاریخ' , style: TextStyle(fontSize: 15, color: Colors.black), 
                             )
                          ),
                          ),

                           ],

                       ),
                        SizedBox(
                        
                          width: double.infinity, 
                          height: 40,
                           child: ElevatedButton( 

                              child: const Text('اضافه کردن', style: TextStyle(fontSize: 15),), 

                            onPressed: (){
                            
                                HomeScreen.moneis.add(
                                Money(
                                   id: Random().nextInt(999),
                                    tittle: NewTransactionsScreen.descriptionController.text,
                                     price: NewTransactionsScreen.priceController.text,
                                      date: '1400/01/01',
                                       isReceived: NewTransactionsScreen.groupId == 1  ? true : false,
                                       )
                                  );
                                
                          
            

                            },
                             ), 
                        ),
                   ],
                   
                ),
             ),
        )
      ),
    );
  }
}

class MyRadioWidget extends StatelessWidget {
 final int? value;
 final int? groupValue;
 final Function(int?) onChanged;


  const MyRadioWidget({super.key,
   required this.value,
    required this.groupValue,
     required this.onChanged,
       
  });

  @override
  Widget build(BuildContext context) {
     return Radio( 
      value: value!,
       groupValue: groupValue!,
        onChanged: onChanged , 
 
   );
   
  }
}

class MyTextfield extends StatelessWidget {
    final String hinttext;
    final TextInputType type;
    final TextEditingController controller;

    const MyTextfield({super.key,  required this.hinttext, this.type = TextInputType.text, required this.controller
    
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hinttext,
      
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey
          )
        ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
          )
      ),
    );
  }
}