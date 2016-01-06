"use strict";

var path = require("path");
var _ = require("lodash");
var vile = require("@brentlintner/vile");

// TODO: this won't work with npm v3
var sass_lint_cli = path.normalize(path.join(__dirname, "..", "node_modules", ".bin", "sass-lint"));

var to_json = function to_json(string) {
  return _.attempt(JSON.parse.bind(null, string));
};

var sass_lint = function sass_lint(custom_config_path) {
  var opts = {};

  opts.args = ["-f", "json", "-v", "-q"];

  if (custom_config_path) {
    opts.args = opts.args.concat("-c", custom_config_path);
  }

  // TODO: easiest to re-use plugin code- using library is ideal
  return vile.spawn(sass_lint_cli, opts).then(function (stdout) {
    return stdout ? to_json(stdout) : [];
  });
};

var into_vile_issues = function into_vile_issues(offenses) {
  return _.flatten(_.map(offenses, function (offense) {
    return _.map(offense.messages, function (event) {
      return vile.issue(event.severity == 1 ? vile.WARNING : vile.ERROR, offense.filePath, event.message + " (" + event.ruleId + ")", { line: event.line, character: event.column });
    });
  }));
};

var punish = function punish(plugin_data) {
  return sass_lint(plugin_data.config).then(into_vile_issues);
};

module.exports = {
  punish: punish
};