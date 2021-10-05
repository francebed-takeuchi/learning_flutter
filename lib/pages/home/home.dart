import 'package:flutter/material.dart';
import 'package:learning_flutter/pages/todo/todo_list.dart';

/// MaterialApp(home: MyHomePage(title: 'Learning Flutter App'));で呼び出されている
/// このclassがアプリを起動した際のHome画面になります。
///
/// class MyApp と class MyHomePageの大きな違いとして
/// class MyAppはStatelessWidgetを継承し、
/// class MyHomePageはStatefulWidgetを継承している点にあります。
///
/// Flutterに限らず、モバイルアプリやWebアプリでまず理解が必要なのが、
/// State(状態)の扱い方です。状態管理と呼ぶことが多いです。
///
/// Stateとはユーザーの入力に応じて、動的に画面を更新するために
/// 保持する値のことを指します。
///
/// 話を戻しますが、StatelessWidgetとStatefulWidgetの違いは
/// Stateとして保持する値の有無によって使い分けます。
/// 下の例を見てみましょう。
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  /// MyHomePageで扱うStateを_MyHomePageState()クラスに委譲する
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// Stateを管理するためのクラス
class _MyHomePageState extends State<MyHomePage> {
  /// このクラスで管理するState
  /// 整数型の_counter変数の初期値に0を代入している
  /// Flutter(Dart)ではPublicやPrivateなどの宣言をしない代わりに
  /// クラスや変数の先頭に"_"をつけるとPrivate扱いになる。
  int _counter = 0;

  /// _counterの値を増加させるための関数
  void _incrementCounter() {
    /// setState((){})の中にStateを変更する処理を記述することでStateの更新を行う
    /// setStateをしないと画面が更新されません
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Scaffoldは足場を意味し、UIの土台になるものを構築します。
    /// 基本的にUIはScaffoldの中に構築します。
    return Scaffold(
      /// UI上部のタイトルが記載されている色付きのBarです。
      appBar: AppBar(
        title: Text(widget.title),
      ),

      /// bodyにはアプリのコンテンツを構築します。
      /// Centerはその名前の通り画面の中央にWidgetを配置します。
      body: Center(
        /// Columnは縦方向に複数のWidgetを配置したい時に使用します。
        /// 横方向に配置したい時はRowを使用します。
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CircleAvatar(backgroundColor: Colors.blue), // 青い丸
                  CircleAvatar(backgroundColor: Colors.red), // 赤い丸
                  Text('Rowを使って横並びに配置'),
                ],
              ),
            ),
            const SizedBox(height: 50), // スペースを入れたい時や大きさを制御するために使います
            Container(
              color: Colors.grey,
              child: Column(
                children: const [
                  CircleAvatar(backgroundColor: Colors.blue), // 青い丸
                  CircleAvatar(backgroundColor: Colors.red), // 赤い丸
                  Text('Columnを使って縦並びに配置'),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              '右下のボタンを押すとカウンターが増加します。',
            ),
            Text(
              '$_counter', // 変数の先頭に$をつけることで文字列に変換することができる
              // _counter.toString(), // こうやって書いても同じ結果が得られる
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 50),

            /// ボタンを表示します。
            /// onPressed:(){}に記述することで、ボタンをタップした時の処理を実装します。
            ElevatedButton(
              onPressed: () {
                /// ボタンを押すとSecondPage()に画面遷移する
                Navigator.of(context).push<void>(
                  MaterialPageRoute(
                    builder: (context) => const TodoListPage(),
                  ),
                );
              },

              /// ボタンにテキストを入れることができます。
              child: const Text('次のページへ'),
            ),
          ],
        ),
      ),

      /// 画面の右下のボタンです。
      /// デフォルトでは右下ですが、表示する場所は変更することができます。
      /// ほとんどの人がスマホを右手の親指で操作することが多いので、右下に表示することが多いです。
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // ボタンを押した時に関数を呼び出しています。
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
