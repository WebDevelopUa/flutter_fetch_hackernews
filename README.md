# Flutter Fetch Hacker News App

A new Flutter pet-project. With a local cache (Sqlite DB on Device).

API Endpoints:
* [Top Stories](https://hacker-news.firebaseio.com/v0/topstories.json)
* [n-Story Item by ID](https://hacker-news.firebaseio.com/v0/item/26690126.json)

 --------

* [Hacker News](https://news.ycombinator.com/)
* [Hacker News API Documentation](https://github.com/hackernews/api)
* [sqflite 2.0.0+3](https://pub.dev/packages/sqflite)
* [path_provider 2.0.1](https://pub.dev/packages/path_provider)
* [JSON and serialization](https://flutter.dev/docs/development/data-and-backend/json)
* []()


 --------


Run in terminal:

``` 
flutter pub get
flutter doctor
flutter run
```

Open web-browser [http://localhost:50743/](http://localhost:50743/)

In case of error:

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