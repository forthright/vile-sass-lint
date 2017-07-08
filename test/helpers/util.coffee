issues = [
  {
    "message": "Expected `color`, found `margin` (property-sort-order)"
    "path": "test.sass"
    "signature": "sass-lint::property-sort-order"
    "type": "style"
    "where": {
      "start": {
        "character": 3
        "line": 4
      }
    }
  }
  {
    "message": "Expected `margin`, found `color` (property-sort-order)"
    "path": "test.sass"
    "signature": "sass-lint::property-sort-order"
    "type": "style"
    "where": {
      "start": {
        "character": 3
        "line": 5
      }
    }
  }
  {
    "message": "!important not allowed (no-important)"
    "path": "test.sass"
    "signature": "sass-lint::no-important"
    "type": "style"
    "where": {
      "start": {
        "character": 15
        "line": 5
      }
    }
  }
  {
    "message": "Expected `color`, found `margin` (property-sort-order)"
    "path": "test.scss"
    "signature": "sass-lint::property-sort-order"
    "type": "style"
    "where": {
      "start": {
        "character": 3
        "line": 4
      }
    }
  }
  {
    "message": "Expected `margin`, found `color` (property-sort-order)"
    "path": "test.scss"
    "signature": "sass-lint::property-sort-order"
    "type": "style"
    "where": {
      "start": {
        "character": 3
        "line": 5
      }
    }
  }
  {
    "message": "!important not allowed (no-important)"
    "path": "test.scss"
    "signature": "sass-lint::no-important"
    "type": "style"
    "where": {
      "start": {
        "character": 15
        "line": 5
      }
    }
  }
  {
    "message": "Please check validity of the block
    starting from line #1 (Fatal)"
    "path": "test_two.sass"
    "signature": "sass-lint::Fatal"
    "type": "maintainability"
    "where": {
      "start": {
        "character": 1
        "line": 1
      }
    }
  }
]

issues_allow = [
  {
    "message": "Expected `color`, found `margin` (property-sort-order)"
    "path": "test.sass"
    "signature": "sass-lint::property-sort-order"
    "type": "style"
    "where": {
      "start": {
        "character": 3
        "line": 4
      }
    }
  }
  {
    "message": "Expected `margin`, found `color` (property-sort-order)"
    "path": "test.sass"
    "signature": "sass-lint::property-sort-order"
    "type": "style"
    "where": {
      "start": {
        "character": 3
        "line": 5
      }
    }
  }
  {
    "message": "!important not allowed (no-important)"
    "path": "test.sass"
    "signature": "sass-lint::no-important"
    "type": "style"
    "where": {
      "start": {
        "character": 15
        "line": 5
      }
    }
  }
]

issues_ignore = [
  {
    "message": "Please check validity of the block
    starting from line #1 (Fatal)"
    "path": "test_two.sass"
    "signature": "sass-lint::Fatal"
    "type": "maintainability"
    "where": {
      "start": {
        "character": 1
        "line": 1
      }
    }
  }
]

issues_custom_conf = [
  {
    "message": "Please check validity of the block starting
    from line #1 (Fatal)"
    "path": "test_two.sass"
    "signature": "sass-lint::Fatal"
    "type": "maintainability"
    "where": {
      "start": {
        "character": 1
        "line": 1
      }
    }
  }
]

module.exports =
  issues: issues
  issues_allow: issues_allow
  issues_ignore: issues_ignore
  issues_custom_conf: issues_custom_conf
