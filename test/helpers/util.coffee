Promise = require "bluebird"
sass_lint_json = require "./../fixtures/sass-lint-json"

setup = (vile) ->
  vile.spawn.returns new Promise (resolve) ->
    resolve(JSON.stringify sass_lint_json)

issues = [
  {
    file: "app/assets/stylesheets/colors.sass",
    msg: "A warning message (something)",
    type: "warn",
    where: { end: { }, start: { line: 20, character: 3 } },
    data: {}
  }
  {
    file: "app/assets/stylesheets/colors.sass",
    msg: "Indentation of 0, expected 2 (indentation)",
    type: "error",
    where: { end: { }, start: { line: 21, character: 1 } },
    data: {}
  }
  {
    file: "app/assets/stylesheets/buttons.sass",
    msg: "Indentation of 0, expected 2 (indentation)",
    type: "error",
    where: { end: { }, start: { line: 2, character: 1 } },
    data: {}
  }
]

module.exports =
  issues: issues
  setup: setup
