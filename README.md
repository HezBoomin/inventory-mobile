<details open>
<summary> Assignment 7 </summary>

# Assignment 7

## Answers

### What are the main differences between stateless and stateful widget in Flutter?

Stateless widgets are the widgets that are immutable. Its appearance and properties remain unchanged throughout the lifetime of the widget. Stateless widgets cannot change their state during the runtime of the app, which means the widgets cannot be redrawn while the app is in action. Stateful Widgets are the ones that change its properties during run-time. They are dynamic i.e., they are mutable and can be drawn multiple times within its lifetime. It can change 

### Explain all widgets that you used in this assignment.

In `main.dart` we have `MyApp` Widget. `MyApp` widget is a stateless widget to configures the app's title, theme, and specifies the initial screen to display. In `menu.dart` there are a couple of widgets. First, there's `MyHomePage`, a stateless widget class that represents the home page. The `build` method of `MyHomePage` returns a Scaffold widget, which provides the basic structure for app's layout, including the app bar and body. `AppBar` widget appears on top of the app, it includes title with custom color style. `SingleChildScrollView` Widget, This widget is used to wrap the content of the body of the Scaffold. It allows for scrolling if the content doesn't fit on the screen. `Column` Widget is used to display children vertically in a linear fashion. `Padding` Widget adds padding around its child. In this case, it wraps a Column and provides padding around its content. `GridView.count` Widget creates a grid layout with a specified number of columns. It uses the items list of ShopItem objects to create a grid of cards. Shopcard is a stateless widget class that represents a card for each shop item. It takes a ShopItem as a parameter in its constructor. It creates a Material card with a specific color and an InkWell to make it clickable. When the card is tapped, it shows a SnackBar with a message indicating which item was pressed.

###  Explain how you implemented the checklist above step-by-step (not just following the tutorial).

1. Create a new Flutter project and run it.

```
flutter create inventory
cd inventory
flutter run
```

2. Create new file `menu.dart` inside the lib folder 

at the first line of the code add `import 'package:flutter/material.dart';`.
Move `MyHomePage` class inside `main.dart` to `menu.dart` file and delete `_MyHomePageState` class.

3. Modifying `main.dart` file

We Import `import 'package:inventory/menu.dart';` inside `main.dart` and modify `home: const MyHomePage(title: 'Flutter Demo Home Page'),` to `home: MyHomePage()`. inside `ThemeData()` add `appBarTheme: const AppBarTheme(color: Colors.indigo,),` and `colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),`

4. Coding `menu.dart` file

Inside `menu.dart` we put the following code to make the app works

```dart
import 'package:flutter/material.dart';

class ShopItem {
    final String name;
    final IconData icon;
    final Color cardColor;

    ShopItem(this.name, this.icon, this.cardColor);
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
      ShopItem("View Items", Icons.checklist ,Colors.indigo),
      ShopItem("Add Item", Icons.add_shopping_cart,Colors.deepPurple),
      ShopItem("Logout", Icons.logout, Colors.deepOrangeAccent),
   ];
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inventory', style: TextStyle(color:Colors.white),
        ),

      ),
      body: SingleChildScrollView(
        // Scrolling wrapper widget
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding for the page
          child: Column(
            // Widget to display children vertically
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Text widget to display text with center alignment and appropriate style
                child: Text(
                  'Inventory', // Text indicating the shop name
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container for our cards.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iteration for each item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
    final ShopItem item;

    const ShopCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
      return Material(
        color: item.cardColor,
        child: InkWell(
          // Responsive touch area
          onTap: () {
            // Show a SnackBar when clicked
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text("You pressed the ${item.name} button!")));
          },
          child: Container(
            // Container to hold Icon and Text
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  const Padding(padding: EdgeInsets.all(3)),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
}
```

