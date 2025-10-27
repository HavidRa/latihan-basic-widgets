import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Data profil (bisa diubah lewat form)
  String name = 'Havid Restu Afyantara';
  String email = 'havid.restu10@gmail.com';
  String phone = '+62 813 4537 4369';

  final String title = 'Scrolling Engineer';
  final String description = 'Scrol Fesnuk, Yapping';
  final String imageUrl = 'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 3,
          margin: EdgeInsets.all(24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(imageUrl, width: 100),
                SizedBox(height: 16),
                Text(name, style: Theme.of(context).textTheme.titleLarge),
                Text(title, style: TextStyle(color: Colors.grey)),
                SizedBox(height: 8),
                Text(description, textAlign: TextAlign.center),
                Divider(height: 30),
                Text('Email: $email'),
                Text('Telepon: $phone'),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _openEditForm(context),
                      child: Text('Edit Profil'),
                    ),
                    ElevatedButton(
                      onPressed: () => _openAboutPage(context),
                      child: Text('Tentang'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Form edit profil dalam dialog
  void _openEditForm(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: name);
    TextEditingController emailController = TextEditingController(text: email);
    TextEditingController phoneController = TextEditingController(text: phone);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit Profil'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Telepon'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                name = nameController.text;
                email = emailController.text;
                phone = phoneController.text;
              });
              Navigator.pop(context);
            },
            child: Text('Simpan'),
          ),
        ],
      ),
    );
  }

  // Halaman Tentang (pakai Navigator.push)
  void _openAboutPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: Text('Tentang Aplikasi')),
          body: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'Aplikasi ini merupakan proyek mini Flutter '
              'yang menampilkan kartu profil, dapat mengubah data melalui form, '
              'dan mendukung tema terang, gelap, serta otomatis.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
