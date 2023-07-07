import 'package:calc_application/constant.dart';
import 'package:calc_application/models/money.dart';
import 'package:calc_application/screens/new_transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';




// ignore: camel_case_types
class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key}); 

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    List<Money> moneis = [
    Money(
      id: 0,
       tittle: 'test1',
        price: '1000',
         date: '1402/04/07',
          isReceived: true
          ),

              Money(
      id: 1,
       tittle: 'test2',
        price: '2000',
         date: '1402/04/07', 
          isReceived: false
          ),
                
                Money(
                 id: 3,
                 tittle: 'test3',
        price: '1000',
         date: '1402/04/07',
          isReceived: true
                )
  ];

  final TextEditingController searchController = TextEditingController();

  final BorderRadius borderRadius = BorderRadius.circular(20);

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
           backgroundColor: kPurpleColor,
           floatingActionButton: FloatingActionButton(
            backgroundColor: kPurpleColor,
            elevation: 0, 
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NewTransactionsScreen(),));
            },
            child: const Icon(Icons.add), 
            ),
            body:   SizedBox(
              width: double.infinity,
             child: Column(
              children: [
               const HeaderWidget(), 
               //Expanded (child: EmptyWidget())

                //MyListTileWidget(),
                Expanded(
                  child: 
                  ListView.builder(
                    itemCount: moneis.length ,
                    itemBuilder: (context, index) {
                    return  MyListTileWidget(index: index,);
                  }),
                
                
                              
                ),],
              
             ),
            ),
        ),
      ),
    );
  }
}

class MyListTileWidget extends StatelessWidget {
  final int? index;
  const MyListTileWidget({required this.index, 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        
      children: [
      
        Padding(padding: const EdgeInsets.all(20),
          child: Container(
            width: 60,
            height: 60, 
            
            decoration: BoxDecoration(
              color: HomeScreen.moneis[index!].isReceived! ? kGreenColor : kRedColor,
              borderRadius: BorderRadius.circular(15),
              
            ),
            child: Icon(HomeScreen.moneis[index!].isReceived! ? Icons.add : Icons.remove,
            color: Colors.white, size: 30,),
            
        
            
          ),

          ),

               Text(HomeScreen.moneis[index!].tittle!),
              const Spacer(),
                Padding(padding: const EdgeInsets.only(right: 20),
                child: Column(
                  
                  children: [
                    Text(HomeScreen.moneis[index!].price!,style: const TextStyle(fontSize: 15),
                    ),
                     Text(HomeScreen.moneis[index!].date!,style: const  TextStyle(fontSize: 15),
                    )
                  ],
              
                ),
              )          
    
      ]
      
    );
  }
}

//HeaderWidget
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(20),
      child: Row(
        children: [
           
          Expanded(
            child: SizedBox(
              width: 100,
              child: TextField(
              decoration: InputDecoration(
                hintText: '...جستجو',
                border: OutlineInputBorder(
                  borderRadius:
                   BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
              style: const TextStyle(fontSize: 18),
            ),
            ),
          ),
          const SizedBox(width: 25),
             const Text('تراکنش ها', style: TextStyle(fontSize: 18))   
            
        ],
          
      ),
    );
  }
}

//EmptyWidget
class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column( 
      children: [
                        const Spacer(),
                SvgPicture.asset(
                  'assets/images/calc.svg' ,
                  height: 200,
                  width: 200,
                  ),
                  const SizedBox(height: 20),
                 const Text('!تراکنشی موجود نیست',style: TextStyle(fontSize: 17),),
                  
                const Spacer(),
      ],
      
    ); 
  }
}

  