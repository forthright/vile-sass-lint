const path = require("path")
const sass_lint = require("sass-lint")
const _ = require("lodash")
const vile = require("vile")

const IS_SASS = /\.(sass|scss)$/

const is_sass_file = (target, is_dir) =>
  is_dir || IS_SASS.test(target)

const allowed = (ignore, allow) => {
  var filtered = vile.filter(ignore, allow)
  return (target, is_dir) =>
    filtered(target) && is_sass_file(target, is_dir)
}

const lint = (filepath, filedata, conf_path) => {
  const opts = {
    text: filedata,
    format: path.extname(filepath).replace(".", ""),
    filename: filepath
  }
  const result = sass_lint.lintText(opts, {}, conf_path)
  return _.get(result, "messages", [])
}

const into_issues = (conf_path) => (filepath, filedata) => {
  const offenses = lint(filepath, filedata, conf_path)

  return _.flatten(
    _.map(offenses, (offense) => {
        return vile.issue({
          type: offense.severity === 1 ? vile.STYL : vile.MAIN,
          path: filepath,
          message: `${offense.message} (${offense.ruleId})`,
          signature: `sass-lint::${offense.ruleId}`,
          where: {
            start: {
              line: offense.line,
              character: offense.column
            }
          }
        })
    }))
}

const punish = (plugin_config) => {
  const ignore = _.get(plugin_config, "ignore")
  const allow = _.get(plugin_config, "allow")
  const conf_path = _.get(plugin_config, "config")

  return vile.promise_each(
    process.cwd(),
    allowed(ignore, allow),
    into_issues(conf_path))
}

module.exports = {
  punish: punish
}
