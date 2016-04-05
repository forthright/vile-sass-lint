"use strict";

var path = require("path");
var _ = require("lodash");
var vile = require("@forthright/vile");

var SASS_LINT = "sass-lint";

var to_json = function to_json(string) {
  return _.attempt(JSON.parse.bind(null, string));
};

var sass_lint = function sass_lint(custom_config_path) {
  var opts = {};

  opts.args = ["-f", "json", "-v", "-q"];

  if (custom_config_path) {
    opts.args = opts.args.concat("-c", custom_config_path);
  }

  return vile.spawn(SASS_LINT, opts).then(function (stdout) {
    return stdout ? to_json(stdout) : [];
  });
};

var into_vile_issues = function into_vile_issues(offenses) {
  return _.flatten(_.map(offenses, function (offense) {
    return _.map(offense.messages, function (event) {
      return vile.issue({
        type: vile.STYL,
        path: offense.filePath,
        title: event.message + " (" + event.ruleId + ")",
        message: event.message + " (" + event.ruleId + ")",
        signature: "sass-lint::" + event.ruleId,
        where: {
          start: { line: event.line, character: event.column }
        }
      });
    });
  }));
};

var punish = function punish(plugin_data) {
  return sass_lint(_.get(plugin_data, "config")).then(into_vile_issues);
};

module.exports = {
  punish: punish
};