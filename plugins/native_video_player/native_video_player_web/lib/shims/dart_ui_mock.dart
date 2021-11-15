import 'dart:html' as html;

// Declare platformViewRegistry.registerViewFactory method for analyzer
class platformViewRegistry {
  static registerViewFactory(
      String viewTypeId, html.Element Function(int viewId) viewFactory) {}
}
