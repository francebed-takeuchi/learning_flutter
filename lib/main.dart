import 'package:flutter/material.dart';
import 'package:learning_flutter/app.dart';

/// FlutterはWidgetと呼ばれる部品を組み合わせて、
/// UIを構築していきます。
///
/// FlutterのWidgetはMaterial Designという
/// WebアプリやモバイルアプリのUIを構築する際の
/// 指標に準拠したWidget(部品)を組み合わせて構築します。
///
/// 良く言えば、誰でも使いやすく、整ったデザインのアプリを作ることができますが、
/// 悪く言えば既視感のあるデザインになります。
/// しかし、世の中のアプリのほとんどがMaterial Designで作られており、
/// アプリケーションは独自性よりもユーザビリティを優先して作る方が望ましいとされているので
/// あまり気にせずにMaterial Designで構築するのが良いと思います。
///
/// ちなみにMaterial DesignもFlutterもGoogleが作ったものです。
///
/// Widgetはデフォルトのままでも十分ほど用意されていますし、
/// 自作することもできます。
/// 多くの場合、デフォルトのWidgetを組み合わせてWidgetを自作していきます。
///
/// どのプログラミング言語でも同様ですが、
/// Flutterもmain関数から実行されます。
/// 下の場合、runApp関数でMyAppというWidgetを呼び出しています。
void main() {
  runApp(const MyApp());
}
