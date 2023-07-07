import 'package:flutter/material.dart';
class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 204, 244),
          body: SizedBox(
            width: double.infinity,
          
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              
              children: [
                
                Padding(padding: EdgeInsets.all(15),
                  child: Text('مدیریت تراکنش ها به تومان',
                  
                  ),
                ),
                MoneyInfoWidget(firsttext: ':دریافتی امروز' , firstprice: '  0 ', secondtext: ':پرداختی امروز', secondprice: '  0 ', ),
                MoneyInfoWidget(firsttext: ':دریافتی این هفته' , firstprice: ' 0 ', secondtext: ':پرداختی این هفته', secondprice: '  0 ', ),
                MoneyInfoWidget(firsttext: ':دریافتی این ماه' , firstprice: ' 0 ', secondtext: ':پرداختی این ماه', secondprice: '  0 ', ),
               
              ],
            ),
          )
        
        ),
    );
    
  }
}

class MoneyInfoWidget extends StatelessWidget {
   
final String firsttext;
final String secondtext;
final String firstprice;
final String secondprice;

const MoneyInfoWidget({super.key, 
  required this.firsttext,
  required this.secondtext,
  required this.firstprice,
  required this.secondprice
  });
  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children:  [
           Expanded(child:
           Text(firstprice)
          ),
          Text(secondtext  , 
          textAlign: TextAlign.right
          ),
           Expanded(
            child: 
            Text(secondprice, 
            textAlign: TextAlign.right
             )
            ),
           Text(firsttext),
         
          
        ],
      ),
    );
  }
}