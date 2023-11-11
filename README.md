<details>
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

</details>

<details open>
<summary> Assignment 8 </summary>

# Assignment 8

## Answers

### Explain the difference between Navigator.push() and Navigator.pushReplacement(), accompanied by examples of the correct usage of both methods!

`Navigator.push()` is used to push a new route onto the stack, while `Navigator.pushReplacement()` is used to push a new route and remove the previous route from the stack. `Navigator.push()` is used when you want to go to a new screen and have the option to go back to the previous screen. `Navigator.pushReplacement()` is used when you want to go to a new screen and don't want to go back to the previous screen.

###  Explain each layout widget in Flutter and their respective usage contexts!

- `Align` widget is used to align its child within itself and optionally, it can also be used to align itself within its parent. It takes an alignment parameter which is of type AlignmentGeometry. It has a single child which is aligned according to the alignment parameter. It is used to align the child widget within itself and optionally, it can also be used to align itself within its parent.
- `AspectRatio` widget is used to size the child widget to a specific aspect ratio. It takes an aspect ratio parameter which is of type double. It has a single child which is sized according to the aspect ratio parameter. It is used to size the child widget to a specific aspect ratio.
- `Baseline` widget is used to align its child widget according to a baseline. It takes a baseline parameter which is of type double. It has a single child which is aligned according to the baseline parameter. It is used to align its child widget according to a baseline.
- `Center` widget is used to align its child widget at the center of itself. It has a single child which is aligned at the center of the parent widget. It is used to align its child widget at the center of itself.
- `ConstrainedBox` widget is used to constrain its child widget to a specific width and height. It takes a constraints parameter which is of type BoxConstraints. It has a single child which is constrained according to the constraints parameter. It is used to constrain its child widget to a specific width and height.
- `Container` widget is used to contain a child widget with some specific styling properties. It takes a child parameter which is of type Widget. It has a single child which is contained within the container. It is used to contain a child widget with some specific styling properties.
- `CustomSingleChildLayout` widget is used to create a custom layout with a single child. It takes a delegate parameter which is of type SingleChildLayoutDelegate. It has a single child which is laid out according to the delegate parameter. It is used to create a custom layout with a single child.
- `Expanded` widget is used to expand its child widget to fill the available space. It takes a flex parameter which is of type int. It has a single child which is expanded according to the flex parameter. It is used to expand its child widget to fill the available space.
- `FittedBox` widget is used to scale its child widget to fit the available space. It takes a fit parameter which is of type BoxFit. It has a single child which is scaled according to the fit parameter. It is used to scale its child widget to fit the available space.
- `FractionallySizedBox` widget is used to size its child widget to a fraction of the available space. It takes a widthFactor and heightFactor parameter which is of type double. It has a single child which is sized according to the widthFactor and heightFactor parameter. It is used to size its child widget to a fraction of the available space.
- `IntrinsicHeight` widget is used to size its child widget to the height of the tallest child. It has a single child which is sized according to the height of the tallest child. It is used to size its child widget to the height of the tallest child.
- `IntrinsicWidth` widget is used to size its child widget to the width of the widest child. It has a single child which is sized according to the width of the widest child. It is used to size its child widget to the width of the widest child.
- `LimitedBox` widget is used to limit its child widget to a specific width and height. It takes a maxWidth and maxHeight parameter which is of type double. It has a single child which is limited according to the maxWidth and maxHeight parameter. It is used to limit its child widget to a specific width and height.
- `Offstage` widget is used to hide its child widget. It takes an offstage parameter which is of type bool. It has a single child which is hidden according to the offstage parameter. It is used to hide its child widget.
- `OverflowBox` widget is used to size its child widget to a specific width and height. It takes a maxWidth and maxHeight parameter which is of type double. It has a single child which is sized according to the maxWidth and maxHeight parameter. It is used to size its child widget to a specific width and height.
- `Padding` widget is used to add padding around its child widget. It takes a padding parameter which is of type EdgeInsetsGeometry. It has a single child which is padded according to the padding parameter. It is used to add padding around its child widget.
- `SizedBox` widget is used to size its child widget to a specific width and height. It takes a width and height parameter which is of type double. It has a single child which is sized according to the width and height parameter. It is used to size its child widget to a specific width and height.
- `SizedOverflowBox` widget is used to size its child widget to a specific width and height. It takes a size parameter which is of type Size. It has a single child which is sized according to the size parameter. It is used to size its child widget to a specific width and height.
- `Transform` widget is used to transform its child widget. It takes a transform parameter which is of type Matrix4. It has a single child which is transformed according to the transform parameter. It is used to transform its child widget.
- `CustomMultiChildLayout` widget is used to create a custom layout with multiple children. It takes a delegate parameter which is of type MultiChildLayoutDelegate. It has multiple children which are laid out according to the delegate parameter. It is used to create a custom layout with multiple children.
- `Column` widget is used to display its children vertically in a linear fashion. It takes a children parameter which is of type List<Widget>. It has multiple children which are displayed vertically in a linear fashion. It is used to display its children vertically in a linear fashion.
- `Flow` widget is used to display its children in a flow layout. It takes a delegate parameter which is of type FlowDelegate. It has multiple children which are displayed in a flow layout according to the delegate parameter. It is used to display its children in a flow layout.
- `GridView` widget is used to display its children in a grid layout. It takes a children parameter which is of type List<Widget>. It has multiple children which are displayed in a grid layout. It is used to display its children in a grid layout.
- `IndexedStack` widget is used to display its children in a stack layout. It takes a children parameter which is of type List<Widget>. It has multiple children which are displayed in a stack layout. It is used to display its children in a stack layout.
- `LayoutBuilder` widget is used to build a layout based on its parent widget's constraints. It takes a builder parameter which is of type LayoutWidgetBuilder. It has a single child which is built according to the builder parameter. It is used to build a layout based on its parent widget's constraints.
- `ListBody` widget is used to display its children in a vertical list layout. It takes a children parameter which is of type List<Widget>. It has multiple children which are displayed in a vertical list layout. It is used to display its children in a vertical list layout.
- `ListView` widget is used to display its children in a scrollable list layout. It takes a children parameter which is of type List<Widget>. It has multiple children which are displayed in a scrollable list layout. It is used to display its children in a scrollable list layout.
- `Row` widget is used to display its children horizontally in a linear fashion. It takes a children parameter which is of type List<Widget>. It has multiple children which are displayed horizontally in a linear fashion. It is used to display its children horizontally in a linear fashion.
- `Stack` widget is used to display its children in a stack layout. It takes a children parameter which is of type List<Widget>. It has multiple children which are displayed in a stack layout. It is used to display its children in a stack layout.
- `Table` widget is used to display its children in a table layout. It takes a children parameter which is of type List<TableRow>. It has multiple children which are displayed in a table layout. It is used to display its children in a table layout.
- `Wrap` widget is used to display its children in a wrap layout. It takes a children parameter which is of type List<Widget>. It has multiple children which are displayed in a wrap layout. It is used to display its children in a wrap layout.

###  List the form input elements you used in this assignment and explain why you used these input elements!

`TextFormField` widget is used to create a text field. It takes a controller parameter which is of type TextEditingController. It is used to create a text field.

### How is clean architecture implemented in a Flutter application?

Clean architecture is implemented in a Flutter application by separating the code into three layers: presentation, domain, and data. The presentation layer is responsible for displaying the UI and handling user input. The domain layer is responsible for business logic and data processing. The data layer is responsible for data storage and retrieval.

### Explain how you implemented the checklist above step-by-step! (not just following the tutorial)

1. Create at least one new page in the application, a page for adding a new item

Create a new file `item_form.dart` inside the lib folder. Create new class `ShopFormPage` to represent the form page. Create class  `_ShopFormPageState` to represent the state of the form page that extend `ShopFormPage`. Initialize the `_formkey` variable to initialize the form key. Initialize variable to take input name,amount, and description. Build the form page with `Scaffold` widget. We also add Appbar that shows text "Add Item Form". Add Drawer to the sacffold. Add Padding for each input using `TextFormField` with some input validation. For `Name` it can't be empty, for `Amount` it can't be empty and must be an integer, and for `Description` it can't be empty. Create a `Save` button to save the input And show `AlerDialog` that show the input and show that the item is successfully added. 

2. Create Drawer 

Create new file `left_drawer.dart` with class `LeftDrawer`. Using `Drawer` widget, we create a drawer that contains `ListView` that contains a `ListTile` to redirect user either to the home page or add item page using `Navigator.pushReplacement()`.

3. Modify the Home Page

We create new file  `item_card.dart` to each card with a special condition if `item.name == Add Item` the card will redirect to the add item page. In `menu.dart` we add the `LeftDrawer` widget to the `Scaffold` widget. Now we also only need to call the item data from `ShopItem` class.

</details>




