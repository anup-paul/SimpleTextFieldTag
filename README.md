<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## SimpleTextFieldTag

SimpleTextFieldTag is a Flutter package that provides an easy-to-use widget for adding, displaying, and managing tags in the form of chips. It offers customizable styling, dynamic tag management, and flexible callback functions, making it ideal for applications where users need to input multiple keywords, skills, or tags. The widget also supports custom controllers and various layout configurations for a responsive user experience.


## Features

1. Dynamic Tag Management
   Add Tags: Users can add tags dynamically by typing in the text field and either pressing the submit button (keyboard "Enter") or clicking the add icon.
   Remove Tags: Users can remove tags by clicking the delete icon (X) on the chips. This ensures a clean and user-friendly interface for managing tags.
2. Customizable Initial Tags
   You can initialize the widget with a list of predefined tags via the initialTags parameter. This allows the tags to be pre-filled based on existing data or preferences.
3. Style Customization
   Label Customization: The labelText and labelStyle parameters allow you to modify the input field's label text and style to fit your design needs.
   Tag Styling: Customize the appearance of the tags (chips) using:
   chipBackgroundColor: Set the background color of the tags.
   tagTextStyle: Customize the text style inside the tags.
   chipBorderSide: Adjust the border of the tags for better visibility or styling.
4. Flexible Callbacks
   onTagAdded: A callback that triggers every time a tag is added. This is useful for logging, analytics, or other tag-related processing in your app.
   onTagRemoved: A callback that is invoked every time a tag is removed. You can use this to trigger backend updates or adjust application states based on tag removal.
5. Controller Support
   The widget can accept an external TextEditingController via the controller parameter. This allows for more control over the text field, including clearing, reading, or modifying the input programmatically.
6. Responsive and Adaptive Layout
   The widget uses a Wrap layout to dynamically arrange tags in rows. This ensures that tags adjust automatically to the available space and provide a smooth user experience, even on smaller screens.



# Installing

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
   simple_textfield_tag: ^0.0.1
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```
$ pub get
```

with `Flutter`:

```
$ flutter pub get
```


### 3. Import it

Now in your `Dart` code, you can use:

```dart
import 'package:simple_textfield_tag/simple_textfield_tag.dart';
```



## Usage

```dart
import 'package:flutter/material.dart';
import 'package:simple_textfield_tag/simple_textfield_tag.dart'; // Import the package

void main() {
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
      return MaterialApp(
         home: Scaffold(
            appBar: AppBar(
               title: const Text('SimpleTextFieldTag Example'),
            ),
            body: const Padding(
               padding: EdgeInsets.all(16.0),
               child: TagInputDemo(),
            ),
         ),
      );
   }
}

class TagInputDemo extends StatefulWidget {
   const TagInputDemo({Key? key}) : super(key: key);

   @override
   _TagInputDemoState createState() => _TagInputDemoState();
}

class _TagInputDemoState extends State<TagInputDemo> {
   final List<String> _initialTags = ['Flutter', 'Dart'];

   void _onTagAdded(String tag) {
      print('Tag added: $tag');
   }

   void _onTagRemoved(String tag) {
      print('Tag removed: $tag');
   }

   @override
   Widget build(BuildContext context) {
      return SimpleTextFieldTag(
         initialTags: _initialTags,            // Initial list of tags
         labelText: 'Enter your skills',       // Custom label text
         labelStyle: const TextStyle(
            fontSize: 14,
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
         ),
         tagTextStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.bold,
         ),
         hintStyle: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
         ),
         chipBackgroundColor: Colors.blueAccent.withOpacity(0.3),  // Customize chip background
         deleteIconColor: Colors.red,                             // Customize delete icon color
         chipBorderSide: const BorderSide(color: Colors.blueAccent),
         onTagAdded: _onTagAdded,                                 // Callback when tag is added
         onTagRemoved: _onTagRemoved,                             // Callback when tag is removed
      );
   }
}




class TagInputWithController extends StatefulWidget {
   const TagInputWithController({Key? key}) : super(key: key);

   @override
   _TagInputWithControllerState createState() => _TagInputWithControllerState();
}

class _TagInputWithControllerState extends State<TagInputWithController> {
   final TextEditingController _tagController = TextEditingController();
   final List<String> _tags = ['Mobile', 'App'];

   @override
   void dispose() {
      _tagController.dispose(); // Dispose of the controller when done
      super.dispose();
   }

   @override
   Widget build(BuildContext context) {
      return SimpleTextFieldTag(
         controller: _tagController,          // Pass in your custom controller
         initialTags: _tags,
         labelText: 'Your interests',
         onTagAdded: (tag) {
            setState(() {
               _tags.add(tag);
            });
            print('Tag added: $tag');
         },
         onTagRemoved: (tag) {
            setState(() {
               _tags.remove(tag);
            });
            print('Tag removed: $tag');
         },
      );
   }
}


class TagInputWithController extends StatefulWidget {
   const TagInputWithController({Key? key}) : super(key: key);

   @override
   _TagInputWithControllerState createState() => _TagInputWithControllerState();
}

class _TagInputWithControllerState extends State<TagInputWithController> {
   final TextEditingController _tagController = TextEditingController();
   final List<String> _tags = ['Mobile', 'App'];

   @override
   void dispose() {
      _tagController.dispose(); // Dispose of the controller when done
      super.dispose();
   }

   @override
   Widget build(BuildContext context) {
      return SimpleTextFieldTag(
         controller: _tagController,          // Pass in your custom controller
         initialTags: _tags,
         labelText: 'Your interests',
         onTagAdded: (tag) {
            setState(() {
               _tags.add(tag);
            });
            print('Tag added: $tag');
         },
         onTagRemoved: (tag) {
            setState(() {
               _tags.remove(tag);
            });
            print('Tag removed: $tag');
         },
      );
   }
}



  SimpleTextFieldTag(
    initialTags: ['UI', 'UX'],
    chipBackgroundColor: Colors.lightGreenAccent,
    deleteIconColor: Colors.deepOrange,
    chipBorderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 2),
    tagTextStyle: const TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
      onTagAdded: (tag) => print('Added tag: $tag'),
      onTagRemoved: (tag) => print('Removed tag: $tag'),
)


```


## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
