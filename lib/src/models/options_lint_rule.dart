// MIT License

// Copyright (c) 2021 Solid Software LLC

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints_template/src/models/rule_config.dart';

/// A base class for emitting information about
/// issues with user's `.dart` files.
abstract class OptionsLintRule<T extends Object?> extends DartLintRule {
  /// Constructor for [OptionsLintRule] model.
  OptionsLintRule(this.config) : super(code: config.lintCode);

  /// Configuration for a particular rule with all the
  /// defined custom parameters.
  final RuleConfig<T> config;

  /// A flag which indicates whether this rule was enabled by the user.
  bool get enabled => config.enabled;
}
