import 'package:flutter/material.dart';
import 'your_files.dart';
import 'create_new_file.dart';
import 'collaborative_editor.dart';

class EditorScreen extends StatefulWidget {
  @override
  _EditorScreenState createState() => _EditorScreenState();
}

// ...
class _EditorScreenState extends State<EditorScreen> {
  final _textController = TextEditingController();
  bool _isBold = false;
  bool _isItalic = false;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Simple Text Editor'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.format_bold, color: _isBold ? Colors.blue : null),
            onPressed: () => _toggleBold(),
          ),
          IconButton(
            icon: Icon(Icons.format_italic,
                color: _isItalic ? Colors.blue : null),
            onPressed: () => _toggleItalic(),
          ),
          SizedBox(width: 16),
          IconButton(
            icon: Icon(Icons.add, color: Colors.blue),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CollaborativeEditorPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'File Options',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Create New File'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateNewFilePage()),
                );
              },
            ),
            ListTile(
              title: Text('Your Files'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YourFilesPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _textController,
          maxLines: null,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Start writing here...',
            hintStyle: TextStyle(
              fontWeight: _isBold ? FontWeight.bold : null,
              fontStyle: _isItalic ? FontStyle.italic : null,
            ),
          ),
        ),
      ),
    );
  }

  void _toggleBold() {
    _applyStyleToSelection(
      fontWeight: _isBold ? FontWeight.normal : FontWeight.bold,
    );
    setState(() {
      _isBold = !_isBold;
    });
  }

  void _toggleItalic() {
    _applyStyleToSelection(
      fontStyle: _isItalic ? FontStyle.normal : FontStyle.italic,
    );
    setState(() {
      _isItalic = !_isItalic;
    });
  }

  void _applyStyleToSelection({FontWeight? fontWeight, FontStyle? fontStyle}) {
    final TextEditingValue value = _textController.value;
    final TextSelection selection = value.selection;

    if (!selection.isCollapsed) {
      final TextStyle style = TextStyle(
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      );

      final String selectedText =
          value.text.substring(selection.start, selection.end);

      _textController.text = value.text.replaceRange(
        selection.start,
        selection.end,
        '',
      );

      _textController.value = value.copyWith(
        text: _textController.text,
        selection: TextSelection.collapsed(
          offset: selection.baseOffset,
        ),
        composing: TextRange.empty,
      );

      _textController.text = _textController.text.replaceRange(
        selection.start,
        selection.start,
        '[${selectedText}]',
      );

      _textController.value = value.copyWith(
        text: _textController.text,
        selection: TextSelection.collapsed(
          offset: selection.baseOffset + 2,
        ),
        composing: TextRange.empty,
      );
    }
  }
}
