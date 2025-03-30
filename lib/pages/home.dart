import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser!;
  // get documentIDs
  List<String> docIDs = [];

  //get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (value) => value.docs.forEach(
            (element) {
              docIDs.add(element.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(32, 65, 186, 1),
        centerTitle: true,
        title: Text(
          user.email!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => FirebaseAuth.instance.signOut(),
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: docIDs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurStyle: BlurStyle.outer,
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(
                                  "https://avatar.iran.liara.run/public",
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              GetUserData(documentId: docIDs[index]),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

//CRUD(Create ,Read ,Update, Delete) operations with firebase

//getting user data

class GetUserData extends StatelessWidget {
  final String documentId;
  const GetUserData({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    // getting the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // converting list to map
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("name: ${data['Name']}\nAge: ${data['Age']}");
        }
        return Text("Loading...");
      },
    );
  }
}
