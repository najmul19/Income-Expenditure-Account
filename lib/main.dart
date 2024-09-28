import 'package:accounts/catagory_widhet.dart';
import 'package:flutter/material.dart';

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
  List<AyBayModel> ayBayList=[
    AyBayModel(ay: "ay", bay: "bay"),
    AyBayModel(ay: "ay", bay: "bay"),
    AyBayModel(ay: "ay", bay: "bay"),
    AyBayModel(ay: "ay", bay: "bay"),
    AyBayModel(ay: "ay", bay: "bay"),
    AyBayModel(ay: "ay", bay: "bay"),
  ];
  @override
  Widget build(BuildContext context) {
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
                      controller: ayTEController,
                      decoration: const InputDecoration(
                        labelText: "Ay",
                        isDense: true,
                      ),
                    )),
                    const SizedBox(width: 8,),
                    Expanded(child: TextFormField(
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
                      onPressed: (){}, child: const Text("Add"))
              ),
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CatagoryWidget(title: 'Ay', color: Colors.green,),
                  CatagoryWidget(title: 'Ay', color: Colors.blue,),
                  CatagoryWidget(title: 'Ay', color: Colors.pink,),
                  CatagoryWidget(title: 'Ay', color: Colors.brown,),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                  itemCount: ayBayList.length,

                  itemBuilder: (context,index){
                    return ListTile(
                      tileColor: Colors.deepPurple.shade300,
                      title: Text(ayBayList[index].ay),
                    );
                  }

              )
              // ListView.separated(
              //     itemBuilder: (context,index){},
              //     separatorBuilder: (context,index){
              //       return SizedBox(height: 10,);
              //     },
              //     itemCount: ayBayList.length,
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class AyBayModel {
  final String ay,bay;

  AyBayModel({required this.ay, required this.bay});

}