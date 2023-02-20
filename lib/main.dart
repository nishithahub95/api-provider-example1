import 'package:api_provider/DataClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>DataClass(),
  child: MaterialApp(
  debugShowCheckedModeBanner: false,
  home: providerScreen(),

  )
  );
  }
}
class providerScreen extends StatefulWidget {
  const providerScreen({Key? key}) : super(key: key);

  @override
  State<providerScreen> createState() => _providerScreenState();
}

class _providerScreenState extends State<providerScreen> {
  @override

  void initState() {
    // TODO: implement initState

    super.initState();
    final postmodel=Provider.of<DataClass>(context,listen: false);
    postmodel.getPostData();
  }
  Widget build(BuildContext context) {
    final postmodel=Provider.of<DataClass>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data'),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:postmodel.loading?Center(
            child: SpinKitThreeBounce(
              duration: Duration(minutes: 15),
              itemBuilder:(BuildContext context,int index){
                return DecoratedBox(decoration:BoxDecoration(borderRadius:BorderRadius.circular(15),
                color: index.isEven? Colors.green:Colors.red
                ) ,);
              },),
          )
              :Center(
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
              margin: EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(4,4),
                    blurRadius: 15,
                    spreadRadius: 1
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4,-4),
                    blurRadius: 15,
                    spreadRadius: 1
                  )
                ]
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40,bottom: 20),
                    child: Text(postmodel.post?.title??'',style: TextStyle(fontWeight: FontWeight.bold
                    ,fontSize: 18
                    ),

                    ),
                  ),
                  Container(
                    child: Text(postmodel.post?.body??''),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
