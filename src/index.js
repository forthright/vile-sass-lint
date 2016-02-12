let path = require("path")
let _ = require("lodash")
let vile = require("@forthright/vile")

// TODO: this won't work with npm v3
const sass_lint_cli = path.normalize(path.join(
	__dirname, "..", "node_modules", ".bin", "sass-lint"
))

let to_json = (string) =>
  _.attempt(JSON.parse.bind(null, string))

let sass_lint = (custom_config_path) => {
  let opts = {}

  opts.args = ["-f", "json", "-v", "-q"]

  if (custom_config_path) {
    opts.args = opts.args.concat("-c", custom_config_path)
  }

  // TODO: easiest to re-use plugin code- using library is ideal
  return vile
    .spawn(sass_lint_cli, opts)
    .then((stdout) => stdout ? to_json(stdout) : [])
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

let punish = (plugin_data) =>
  sass_lint(plugin_data.config)
    .then(into_vile_issues)

module.exports = {
  punish: punish
}
