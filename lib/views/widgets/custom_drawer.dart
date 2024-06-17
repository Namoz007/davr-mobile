import 'package:exam_file/views/screens/payment_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 120,
            child: DrawerHeader(
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                leading: const Icon(Icons.person),
                title: const Text("XUSANBOY T."),
                trailing: const Icon(Icons.arrow_forward_ios),
                tileColor: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Sozlamalar"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  tileColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 10,),
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
                  },
                  leading: const Icon(Icons.settings),
                  title: const Text("Otkazmalar"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  tileColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}