import 'package:accounts/catagory_widhet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const Acount());


}

class Acount extends StatelessWidget {
  const Acount({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        inputDecorationTheme:  InputDecorationTheme(

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple,width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
              enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple,width: 1),
                borderRadius: BorderRadius.circular(20),
        )
        )
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ayTEController = TextEditingController();
  final bayTEController = TextEditingController();
  GlobalKey<FormState> formKey  = GlobalKey<FormState>();

  List<AyBayModel> ayBayList=[];
  int calculateAysum(List<AyBayModel>ayBayList){
    int sumOfAy = 0;
    for( AyBayModel i in ayBayList){
      sumOfAy += int.parse(i.ay);
    }
    return sumOfAy;
  }
  int calculateBaysum(List<AyBayModel>ayBayList){
    int sumOfAy = 0;
    for( AyBayModel i in ayBayList){
      sumOfAy += int.parse(i.bay);
    }
    return sumOfAy;
  }
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    int result = calculateAysum(ayBayList);
    int resultBay = calculateBaysum(ayBayList);
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Ay bay hisab"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade900,

      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
               Form(
                 key: formKey,
                 child: Row(
                  children: [
                    Expanded(child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: ayTEController,
                      decoration: const InputDecoration(
                        labelText: "Ay",
                        isDense: true,
                      ),
                    )),
                    const SizedBox(width: 8,),
                    Expanded(child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: bayTEController,
                      decoration: const InputDecoration(
                          labelText: "Bay",
                        isDense: true,
                      ),
                    )),
                  ],
                               ),
               ),
              const SizedBox(height: 10,),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: (){
                        setState(() {});
                        ayBayList.add(AyBayModel(ay: ayTEController.text.trim(), bay: bayTEController.text.trim(), date: DateFormat("yMd").format(time)));
                        ayTEController.clear();
                        bayTEController.clear();
                      }, child: const Text("Add"))
              ),
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CatagoryWidget(title: 'Ay', color: Colors.green,),
                  CatagoryWidget(title: 'Date', color: Colors.blue,),
                  CatagoryWidget(title: 'Bay', color: Colors.pink,),
                  CatagoryWidget(title: 'More', color: Colors.brown,),
                ],
              ),
              const SizedBox(height: 10,),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                color: Colors.deepPurple.shade200,
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                    itemCount: ayBayList.length,

                    itemBuilder: (context,index){
                      return SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          child: Row(

                            children: [
                              const SizedBox(width: 5,),
                              SizedBox(
                                  width: 70,
                                  child: Text(ayBayList[index].ay, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),maxLines: 1, overflow: TextOverflow.ellipsis,)),
                              const SizedBox(width: 10,),
                              SizedBox(height: 30,
                                  width: 100,
                                  child: Card(
                                      margin: EdgeInsets.zero,
                                      child: Center(child: Text(ayBayList[index].date)))),
                              const SizedBox(width: 10,),
                              SizedBox(
                                  width: 70,
                                  child: Text(ayBayList[index].bay, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),maxLines: 1, overflow: TextOverflow.ellipsis,)),
                              const SizedBox(width: 10,),
                              const Spacer(),
                               InkWell(
                                  onTap: (){
                                    ayBayList.remove(ayBayList[index]);
                                    setState(() {});
                                  },
                                  child: const Icon(Icons.delete, )),

                              const SizedBox(width: 10,),
                            ],
                          ),
                        ),
                      );
                    }

                ),
              )

            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(onPressed: (){}, label: Text("total ay: $result")),
          const SizedBox(width: 4,),
          FloatingActionButton.extended(onPressed: (){}, label: Text("total bay: $resultBay")),
          const SizedBox(width: 4,),
          FloatingActionButton.extended(onPressed: (){}, label: Text("total: ${result-resultBay}")),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class AyBayModel {
  final String ay,bay,date;
  AyBayModel({required this.date, required this.ay, required this.bay});

}