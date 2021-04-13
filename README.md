# Flutter Fetch Hacker News App

Flutter pet-project with local cache (Sqlite DB on Device) & BLoC pattern (multiple stream builders => single stream)

### API Endpoints:

* [Top Stories](https://hacker-news.firebaseio.com/v0/topstories.json)
* [n-Story Item by ID](https://hacker-news.firebaseio.com/v0/item/26690126.json)

 --------

### App flow:

1. Fetch Top news
2. Fetch certain News item (with ID 20)
3. Check the certain News item (with ID 20) was fetched before (Repository):

- 3.1. (NewsDbProvider => SQLite => Get item)
- 3.2. (NewsApiProvider => HackerNewsApi => Fetch item)

4. Put certain News item (with ID 20) to DB (NewsDbProvider => SQLite => Put item)
5. BLoC Widgets (StreamController, RxDart):

- 5.1. Stories BLoC (Top News screen)
- 5.2. Comments BLoC (Story details + Comments screen)

6. Display items on News List Screen

 --------

* [Hacker News](https://news.ycombinator.com/)
* [Hacker News API Documentation](https://github.com/hackernews/api)
* [sqflite 2.0.0+3](https://pub.dev/packages/sqflite)
* [path_provider 2.0.1](https://pub.dev/packages/path_provider)
* [JSON and serialization](https://flutter.dev/docs/development/data-and-backend/json)
* [http 0.13.1](https://pub.dev/packages/http)
* [HTTP package documentation](https://pub.dev/documentation/http/latest/)
* [Client class](https://pub.dev/documentation/http/latest/http/Client-class.html)
* [http.testing library](https://pub.dev/documentation/http/latest/http.testing/http.testing-library.html)
* [test 1.16.8](https://pub.dev/packages/test)
* [MockClient class](https://pub.dev/documentation/http/latest/http.testing/MockClient-class.html)
* [List<E> class](https://api.flutter.dev/flutter/dart-core/List-class.html)
* [cast<R> method](https://api.flutter.dev/flutter/dart-core/List/cast.html)
* [SQLite](https://sqlite.org/docs.html)
* [FutureBuilder<T> class](https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html)
* [ListView class](https://api.flutter.dev/flutter/widgets/ListView-class.html)
* [ListView.builder constructor](https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html)
* [rxdart 0.26.0](https://pub.dev/packages/rxdart)
* [Rx abstract class](https://pub.dev/documentation/rxdart/latest/rx/Rx-class.html)
* [rx_transformers library](https://pub.dev/documentation/rxdart/latest/rx_transformers/rx_transformers-library.html)
* [BehaviorSubject<T> class](https://pub.dev/documentation/rxdart/latest/rx/BehaviorSubject-class.html)
* [ScanStreamTransformer<S, T> class](https://pub.dev/documentation/rxdart/latest/rx/ScanStreamTransformer-class.html)
* [AsyncSnapshot<T> class](https://api.flutter.dev/flutter/widgets/AsyncSnapshot-class.html)
* [CircularProgressIndicator class](https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html)

 --------


Run in terminal (in project folder):

``` 
flutter pub get
flutter doctor -v
flutter run
flutter test
flutter clean
```

Open web-browser [http://localhost:50743/](http://localhost:50743/)

In case of errors:

### path_provider error

``` 
errors.dart:187 Uncaught (in promise) 
Error: MissingPluginException(No implementation found for method 
getApplicationDocumentsDirectory on channel plugins.flutter.io/path_provider)
```

Instead of web-browser use Emulator

- A Flutter plugin for finding commonly used locations on the filesystem.
- Supports iOS, Android, Linux and MacOS.
- Not all methods are supported on all platforms.

``` 
Failed to establish connection with the application instance in Chrome.
This can happen if the websocket connection used by the web tooling is unable to correctly establish a connection, for example due to a firewall.
```

- on Editor Android Studio or Intellij goto -> Run >> Flutter Run In Release Mode or:

``` 
flutter run -d chrome --release
```

- To hot restart changes while running, press ```r``` or ```Shift + r```
- To save, press ```Ctrl + s```
- To quit, press ```q```

To update the Flutter run:

``` 
flutter channel stable
flutter upgrade 
```

------

## Android Studio

- Open plugin preferences in Android Studio (File => Settings => Plugins).
- Select Browse repositories, select the Flutter plugin => click Install.
- Click Yes when prompted to install the Dart plugin.
- Click Restart when prompted.
- Tools => ADV Manager => Create Virtual Device => Actions => Launch this ADV in emulator =>
- open main.dart => select Device (on top panel) => press Run (
  &#9658;) [https://graphemica.com/%E2%96%B8](https://graphemica.com/%E2%96%B8)
- Tools => Flutter
- ```flutter run -d chrome --release```

Open web-browser in [http://localhost:56338/#/](http://localhost:56338/#/)

------