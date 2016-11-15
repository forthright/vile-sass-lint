Promise = require "bluebird"
sass_lint_json = require "./../fixtures/sass-lint-json"

setup = (vile) ->
  vile.spawn.returns new Promise (resolve) ->
    resolve({
      code: 0
      stdout: JSON.stringify sass_lint_json
      stderr: ""
    })

issues = [
  {
    path: "app/assets/stylesheets/colors.sass",
    title: "A warning message (something)",
    message: "A warning message (something)",
    type: "style",
    signature: "sass-lint::something",
    where: { start: { line: 20, character: 3 } }
  }
  {
    path: "app/assets/stylesheets/colors.sass",
    title: "Indentation of 0, expected 2 (indentation)",
    message: "Indentation of 0, expected 2 (indentation)",
    type: "style",
    signature: "sass-lint::indentation",
    where: { start: { line: 21, character: 1 } }
  }
  {
    path: "app/assets/stylesheets/buttons.sass",
    title: "Indentation of 0, expected 2 (indentation)",
    message: "Indentation of 0, expected 2 (indentation)",
    type: "style",
    signature: "sass-lint::indentation",
    where: { start: { line: 2, character: 1 } }
  }
]

module.exports =
  issues: issues
  setup: setup
