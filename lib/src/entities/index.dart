import 'package:exception_templates/exception_templates.dart';
import 'package:meta/meta.dart';

import 'model.dart';
import 'sqlite_expressions.dart';

/// Defines an Sqlite index.
class Index<M extends Model> {
  const Index({
    @required this.expressions,
    this.isUnique = false,
    this.name = '',
  });

  /// A set of Sqlite expressions.
  /// Use [ColumnLiteral] to specify a column.
  final List<ColumnExpr<M, dynamic>> expressions;

  /// Set this flag to true to generate a UNIQUE index.
  final bool isUnique;

  /// Name of index.
  final String name;

  /// Name of table.
  String get table => M.toString();

  /// Returns a [String] containing the Sqlite command to create the index.
  @override
  String toString() {
    final b = StringBuffer();
    b.write('CREATE ');
    if (isUnique) {
      b.write('UNIQUE ');
    }
    b.write('INDEX ');
    if (isValidIdentifier(name)) {
      b.write('$name ');
    }
    b.write('ON ${table}(');
    b.writeAll(expressions, ', ');
    b.write(');');
    return b.toString();
  }
}
