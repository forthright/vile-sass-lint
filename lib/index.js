"use strict";

var path = require("path");
var sass_lint = require("sass-lint");
var _ = require("lodash");
var vile = require("vile");

var IS_SASS = /\.(sass|scss)$/;

var is_sass_file = function is_sass_file(target, is_dir) {
  return is_dir || IS_SASS.test(target);
};

var allowed = function allowed(ignore, allow) {
  var filtered = vile.filter(ignore, allow);
  return function (target, is_dir) {
    return filtered(target) && is_sass_file(target, is_dir);
  };
};

var lint = function lint(filepath, filedata, conf_path) {
  var opts = {
    text: filedata,
    format: path.extname(filepath).replace(".", ""),
    filename: filepath
  };
  var result = sass_lint.lintText(opts, {}, conf_path);
  return _.get(result, "messages", []);
};

var into_issues = function into_issues(conf_path) {
  return function (filepath, filedata) {
    var offenses = lint(filepath, filedata, conf_path);

    return _.flatten(_.map(offenses, function (offense) {
      return vile.issue({
        type: offense.severity === 1 ? vile.STYL : vile.MAIN,
        path: filepath,
        message: offense.message + " (" + offense.ruleId + ")",
        signature: "sass-lint::" + offense.ruleId,
        where: {
          start: {
            line: offense.line,
            character: offense.column
          }
        }
      });
    }));
  };
};

var punish = function punish(plugin_config) {
  var ignore = _.get(plugin_config, "ignore");
  var allow = _.get(plugin_config, "allow");
  var conf_path = _.get(plugin_config, "config");

  return vile.promise_each(process.cwd(), allowed(ignore, allow), into_issues(conf_path));
};

module.exports = {
  punish: punish
};