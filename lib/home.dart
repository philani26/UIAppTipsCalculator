import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {

  double _billAmount = 0.0;
  int _tipPercentage = 0;
  int _personCounter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: ListView(
          padding: EdgeInsets.all(22.0),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.purpleAccent[100].withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total Per Person'),
                  Text('R122'),
                ],
              ),
            ),
             Container(
               margin: EdgeInsets.only(top: 20),
               padding: EdgeInsets.all(12),
               decoration: BoxDecoration(
                 color: Colors.transparent,
                 border: Border.all(
                   color: Colors.grey[200],
                   style: BorderStyle.solid
                 ),
                 borderRadius: BorderRadius.circular(12.0)
               ),
               child: Column(

                 children: [
                   TextField(
                     keyboardType: TextInputType.numberWithOptions(decimal: true),
                     style: TextStyle(color: Colors.grey),
                     decoration: InputDecoration(
                       prefixText: 'Bill Amount',
                       prefixIcon: Icon(Icons.attach_money)
                     ),
                     onChanged: (String value) {
                       try {
                        _billAmount = double.parse(value);
                   }
                   catch(e){
                      _billAmount = 0.0;
                   }
                   },
                   ),
                   SizedBox(height: 10),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Split'),
                       Row(
                         children: [
                           InkWell(
                             onTap: (){
                               setState(() {
                                 if(_personCounter > 1){
                                   _personCounter--;
                                 }else{}
                               });
                             },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.purpleAccent[100].withOpacity(0.2),
                              ),
                              child: Center(
                                child: Text('-', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.purpleAccent[200],
                                ),),
                              ),
                            ),
                           ),
                           Text('$_personCounter', style:  TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 18.0,
                             color: Colors.purpleAccent[200],
                           )),
                           InkWell(
                             onTap: (){
                               setState(() {
                               _personCounter++;
                               });
                             },
                             child: Container(
                               width: 40,
                               height: 40,
                               margin: EdgeInsets.all(10.0),
                               decoration: BoxDecoration(

                                 color: Colors.purpleAccent[100].withOpacity(0.2),
                                 borderRadius: BorderRadius.circular(7.0)
                               ),
                                 child: Center(
                                   child: Text('+', style:  TextStyle(
                                     fontWeight: FontWeight.bold,
                                     fontSize: 18.0,
                                     color:Colors.purpleAccent
                                   ),),
                                 ),
                             ),
                           ),


                         ],
                       ),
                     ],
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Tips',),
                       Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Text('85',style:TextStyle(
                           color: Colors.purpleAccent[200],
                           fontWeight: FontWeight.bold,
                           fontSize: 17.0
                         ))
                       )
                     ],
                   ),

                 ],
               ),
             )

          ],
        ),

      ),
    );
  }
}
