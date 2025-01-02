import 'package:api_service/models/post_model.dart';
import 'package:flutter/material.dart';


class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0e0af2),
      appBar: AppBar(
        title: Text(
          'Post Details',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0xff0e0af2),
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color of the back button to white
        ),
      ),

      body: Container(
        decoration: BoxDecoration(color: post.id%2==1? Color(0xFFffe6fe): Color(0xfffffef0),
          borderRadius: BorderRadiusDirectional.horizontal(start: Radius.circular(20), end: Radius.circular(20))
        ),
        margin: EdgeInsets.only(top: 30),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0e0af2)
                ),
              ),
              SizedBox(height: 16),
              Text(
                post.body,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff715eff),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Post ID: ${post.id}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Color(0xff715eff)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
