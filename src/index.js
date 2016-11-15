let path = require("path")
let _ = require("lodash")
let vile = require("@forthright/vile")

const SASS_LINT = "sass-lint"

let to_json = (string) =>
  _.attempt(JSON.parse.bind(null, string))

let sass_lint = (custom_config_path, allow_paths) => {
  let opts = {}

  opts.args = ["-f", "json", "-v", "-q"]

  if (custom_config_path) {
    opts.args = opts.args.concat("-c", custom_config_path)
  }

  if (!_.isEmpty(allow_paths)) {
    opts.args = opts.args.concat(allow_paths)
  }

  return vile
    .spawn(SASS_LINT, opts)
    .then((spawn_data) => {
      let stdout = _.get(spawn_data, "stdout", "")
      return stdout ? to_json(stdout) : []
    })
}

let into_vile_issues = (offenses) =>
  _.flatten(
		_.map(offenses, (offense) =>
			_.map(offense.messages, (event) =>
				vile.issue({
          type: vile.STYL,
					path: offense.filePath,
					title: `${event.message} (${event.ruleId})`,
					message: `${event.message} (${event.ruleId})`,
          signature: `sass-lint::${event.ruleId}`,
					where: {
            start: { line: event.line, character: event.column }
          }
        })
			)))

let punish = (plugin_data) => {
  let config_path = _.get(plugin_data, "config")
  let allow = _.get(plugin_data, "allow", [])
  return sass_lint(config_path, allow)
    .then(into_vile_issues)
}

module.exports = {
  punish: punish
}
