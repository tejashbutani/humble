import 'package:flutter/material.dart';
import 'package:humble/user_model.dart';

class ProfilePage extends StatefulWidget {
  User user;
  ProfilePage(this.user, {Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Humble',), centerTitle: true,),
      body: Center(
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
              Image.network(widget.user.avatar, fit: BoxFit.cover,
              height: 200, width: 200,),
              const SizedBox(height: 8,),
              Text('${widget.user.firstName} ${widget.user.lastName}',
              style: const TextStyle(fontSize: 24),),
            ],
          ),
        ),
      )
    );
  }
}
