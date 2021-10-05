import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learning_flutter/pages/home/home.dart';

/// 最初にrunAppで呼び出すWidgetには、
/// 主にこのアプリの設定を記述します。
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Material DesignのWidgetを使用できるようにreturn MaterialAppする
    return MaterialApp(
      /// title: でこのアプリのタイトルを設定する
      title: 'Learning Flutter App',

      /// theme: でこのアプリのテーマを設定する
      /// ThemeDataをいじることでアプリの色やフォントサイズなど
      /// 自由に設定することができる。
      /// 今回は青に設定するので、primarySwatch: Colors.blueにしている
      theme: ThemeData(primarySwatch: Colors.blue),

      /// この辺は呪文みたいなものなので特に気にしなくてよし
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', 'JP'),
      ],

      /// home: このアプリのHome画面(アプリを起動して最初に表示される画面)に
      /// MyHomePageを指定している。
      /// MyHomePageはコンストラクタとして[String title]が必要なので、
      /// 文字列を渡している。
      home: const MyHomePage(title: 'Learning Flutter App'),
    );
  }
}
