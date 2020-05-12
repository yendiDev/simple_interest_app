import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //defining form key
  var _formKey = GlobalKey<FormState>();

  //defining controllers
  TextEditingController _principalController = TextEditingController();
  TextEditingController _interestController = TextEditingController();
  TextEditingController _termsController = TextEditingController();

  var _currencies = ['Dollars', 'Cedis', 'Naira'];

  String choice = '';

  //define strings for user input
  String principal, rate, term;
  String result = '';

  void eraseData(){
    setState(() {
      _principalController.clear();
      _interestController.clear();
      _termsController.clear();
      result = '';
    });

  }

  void calculateInterest(){

    principal = _principalController.text;
    rate = _interestController.text;
    term = _termsController.text;

    if(principal.isEmpty || rate.isEmpty || term.isEmpty){

    } else{
      setState(() {
        //calculate the interest
        //formula is: ( p x r x t ) / 100= interest
        if(_formKey.currentState.validate()){
          double val = (double.parse(principal)
              * double.parse(rate) * double.parse(term)) / 100;
          result = val.toString();

        }


      });
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
        backgroundColor: Colors.blueAccent[700],
      ),

      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[

            SizedBox(height: 20.0,),

            Image.asset(
              'assets/bank.png',
              height: 150.0,
              width: 100.0,
            ),

            SizedBox(height: 30.0,),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _principalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Principal",
                    labelText: "Principal",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _interestController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Rate of Interest",
                    labelText: "Interest",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),

                    )
                ),
              ),
            ),

            Row(
              children: <Widget>[

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _termsController,
                      validator: (String val){
                        if(val.isEmpty){
                          return 'Please complete form';
                        }

                        return '';
                      },
                      decoration: InputDecoration(
                          hintText: "Terms",
                          labelText: "Period of Loan",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),

                          )
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      items: _currencies.map((String val){
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          choice = value;
                        });

                      },

                      value: choice = _currencies[0],
                    ),
                  ),
                )

              ],
            ),

            Row(
              children: <Widget>[

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: (){
                        calculateInterest();
                      },
                      child: Text("Calculate", style: TextStyle(
                          color: Colors.white
                      )),
                      color: Colors.blueAccent,
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: (){
                        eraseData();
                      },
                      child: Text("Reset", style: TextStyle(
                        color: Colors.white
                      )),
                      color: Colors.blueAccent,
                    ),
                  ),
                )

              ],
            ),

            Center(
              child: Text(result,
              style: TextStyle(
                fontSize: 19.0,
                color: Colors.white
              ),),
            )

          ],
        )

      ),

    );
  }
}
