import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project}}/{{#snakeCase}}{{module}}{{/snakeCase}}/{{#snakeCase}}{{name}}{{/snakeCase}}/models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';
import 'package:{{project}}/core/components/base_component.dart';


class {{#pascalCase}}{{name}}{{/pascalCase}}Card extends BaseComponent {
  final {{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}};
  const {{#pascalCase}}{{name}}{{/pascalCase}}Card(this.{{#camelCase}}{{name}}{{/camelCase}}, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Text({{#camelCase}}{{name}}{{/camelCase}}.uuid),
    );
  }
}