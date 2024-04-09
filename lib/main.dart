import 'package:flutter/material.dart';
import 'keyboard_action_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const Test_BottomNavigationBar()
    );
  }
}


class Test_BottomNavigationBar extends StatefulWidget {
  const Test_BottomNavigationBar({super.key});

  @override
  State<Test_BottomNavigationBar> createState() => _Test_BottomNavigationBar();
}

class _Test_BottomNavigationBar extends State<Test_BottomNavigationBar> {

  // ナビゲーションバーがタップされた場所を格納する変数を定義
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    MyHomePage(title: 'Flutter Demo Home Page'),
    Sample()
  ];


  // ナビゲーションバーがタップされたときの挙動を記述した関数を定義
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print("タップされた場所は" + _selectedIndex.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      // ナビゲーションバーのアイコンと文字をそれぞれ設定
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Simple',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Builder',
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'プロフィール',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '履歴',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'チケット',
          ),*/
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // https://zenn.dev/your3i/articles/1a59d5c7a2734d
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Builder(
            builder: ((context) => SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    (Scaffold.of(context).appBarMaxHeight ?? 0),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    Container(
                      height: 300,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                decoration:
                                const InputDecoration(hintText: 'Username'),
                              ),
                              TextFormField(
                                decoration:
                                const InputDecoration(hintText: 'Password'),
                              ),
                            ],
                          )),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        //primary: Colors.blue,
                        minimumSize: const Size.fromHeight(44), // NEW
                      ),
                      child: const Text('Log in'),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 34,
                    )
                  ]),
                ),
              ),
            )))
    );
  }
}
