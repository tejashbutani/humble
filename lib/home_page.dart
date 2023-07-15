
import 'package:flutter/material.dart';
import 'package:humble/api_service.dart';
import 'package:humble/data_processer.dart';
import 'package:humble/profile_page.dart';
import 'package:humble/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLoading = true;
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData()async{
    users = await UserDataProcessor(APIService()).process();
    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      appBar: AppBar(
        title: const Text('Humble',),
        centerTitle: true,
      ),
      body: isLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          User user = users[index];
          return listItem(user);
        },
      ),
    );
  }

  Widget listItem(User user){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(user)));
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12),),
        ),
        margin: const EdgeInsets.only(bottom: 12,right: 16, left: 16),
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(user.avatar, fit: BoxFit.cover,),
            Text('${user.firstName} ${user.lastName}'),
          ],
        ),
      ),
    );
  }
}

